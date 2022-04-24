import 'package:get/get.dart';
import 'package:wan_flutter/common/http/base_provider.dart';

abstract class IRegisterProvider {
  Future<bool> register(String username, String password, String repassword);
}

class RegisterProvider extends BaseProvider implements IRegisterProvider {
  @override
  Future<bool> register(String username, String password, String repassword) => post(
      '/user/registerV2',
      FormData({
        'username': username,
        'password': password,
        'repassword': repassword,
        'verifyCode': '2020'
      })).then((value) => value.toBaseResponse().errorCode == 0);
}
