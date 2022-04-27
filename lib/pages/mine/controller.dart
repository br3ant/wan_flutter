import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:wan_flutter/common/base/get/get_extension.dart';
import 'package:wan_flutter/common/routes/app_pages.dart';
import 'package:wan_flutter/common/utils/save/sp_util.dart';
import 'package:wan_flutter/common/utils/toast_util.dart';
import 'package:wan_flutter/pages/login/entity/userinfo.dart';
import 'package:wan_flutter/pages/mine/provider.dart';

class MineController extends GetxController {
  final IMineProvider provider;

  MineController(this.provider);

  ///用户信息
  UserEntity? userInfo;

  @override
  void onInit() {
    super.onInit();
    var info = SpUtil.getUserInfo();
    if (info != null) {
      userInfo = info;
      update();
    }
  }

  /// 更新用户信息，每次进入时更新
  void notifyUserInfo() {
    provider.getUserInfo().then((value) {
      _saveUserInfo(value);
    }, onError: (e) {
      ToastUtils.show(e.toString());
    });
  }

  void _saveUserInfo(UserEntity user) {
    userInfo = user;
    update();
    SpUtil.notifyUserInfo(user);
  }

  void _removeUserInfo() {
    userInfo = null;
    update();
    SpUtil.deleteUserInfo();
  }

  void navigation2Login() async {
    final user = await Get.toNamed(AppRoutes.login);
    if (user != null) {
      _saveUserInfo(user);
    }
  }

  void logout() {
    Get.showDialog(content: "确认退出登陆?", nextText: "退出", nextTap: () => _removeUserInfo());
  }
}
