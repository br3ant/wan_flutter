import 'package:get/get.dart';
import 'package:wan_flutter/common/res/strings.dart';
import 'package:wan_flutter/common/routes/app_pages.dart';
import 'package:wan_flutter/common/utils/toast_util.dart';
import 'package:wan_flutter/pages/register/provider.dart';

class RegisterController extends GetxController {
  final IRegisterProvider provider;

  RegisterController(this.provider);

  String account = "";
  String password = "";
  String rePassword = "";

  ///当前按钮是否可点击
  bool changeShowButton() {
    return account.isNotEmpty && password.isNotEmpty && rePassword.isNotEmpty;
  }

  ///点击注册
  /// 注册成功跳转
  register() {
    if (account.isEmpty || password.isEmpty || rePassword.isEmpty) {
      return;
    }

    ///账户名：>6位
    if (account.isEmpty || account.length < 6) {
      ToastUtils.show(account.isEmpty
          ? StringStyles.registerAccountEmpty.tr
          : StringStyles.registerAccountLength.tr);
      return;
    }

    ///密码：>6位
    if (password.isEmpty || password.length < 6) {
      ToastUtils.show(password.isEmpty
          ? StringStyles.registerPasswordEmpty.tr
          : StringStyles.registerPasswordLength.tr);
      return;
    }

    ///确认密码：>6位
    if (rePassword.isEmpty || rePassword.length < 6) {
      ToastUtils.show(rePassword.isEmpty
          ? StringStyles.registerRePasswordEmpty.tr
          : StringStyles.registerRePasswordLength.tr);
      return;
    }

    ///密码 == 确认密码
    if (password != rePassword) {
      ToastUtils.show(StringStyles.registerPasswordDiff.tr);
      return;
    }

    provider.register(account, password, rePassword).then((value) {
      if (value) {
        ToastUtils.show(StringStyles.registerSuccess.tr);
      } else {
        ToastUtils.show("error");
      }
    }).catchError((e) {
      ToastUtils.show(e.toString());
    });
  }
}
