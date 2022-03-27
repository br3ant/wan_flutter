import 'package:wan_flutter/common/http/base_provider.dart';

abstract class IRegisterProvider {
  Future<void> register(String username, String password, String repassword);
}

class RegisterProvider extends BaseProvider implements IRegisterProvider {
  @override
  Future<void> register(String username, String password, String repassword) =>
      post('/user/register', {
        'username': username,
        'password': password,
        'repassword': repassword
      });
}
