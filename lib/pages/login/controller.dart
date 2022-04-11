import 'package:get/get.dart';
import 'package:wan_flutter/common/utils/toast_util.dart';
import 'package:wan_flutter/pages/login/provider.dart';

class LoginController extends GetxController {
  final LoginProvider provider;

  LoginController({required this.provider});

  ///账号
  String account = "";

  ///密码
  String password = "";

  Future<void> login() async {
    if (account.isEmpty ||
        password.isEmpty) {
      return;
    }

    ///账户名：>6位
    if (account.isEmpty || account.length < 6) {
      ToastUtils.show("账户名小于6位");
      return;
    }

    ///密码：>6位
    if (password.isEmpty || password.length < 6) {
      ToastUtils.show("密码小于6位");
      return;
    }

    provider.login(account, password).then((value) => {})
        .catchError((e) => {Get.snackbar("Error", e.toString())});
  }

  ///当前按钮是否可点击
  bool changeShowButton(){
    return account.isNotEmpty &&
        password.isNotEmpty;
  }


}
