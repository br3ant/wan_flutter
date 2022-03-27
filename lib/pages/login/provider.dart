import 'package:get/get.dart';
import 'package:wan_flutter/common/http/base_provider.dart';

abstract class ILoginProvider {
  Future<Response> login(String username, String password);
}

class LoginProvider extends BaseProvider implements ILoginProvider {
  @override
  Future<Response> login(String username, String password) =>
      post('/user/login', {"username", username, 'password', password});
}
