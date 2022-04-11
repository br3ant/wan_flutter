import 'package:get/get.dart';
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
    notifyUserInfo();
  }

  /// 更新用户信息，每次进入时更新
  void notifyUserInfo() {
    provider.getUserInfo().then((value) {
      userInfo = value;
      update();
      SpUtil.notifyUserInfo(value);
    }, onError: (e) {
      ToastUtils.show(e.toString());
    });
  }

  void navigation2Login(){
    Get.toNamed(AppRoutes.login);
  }
}
