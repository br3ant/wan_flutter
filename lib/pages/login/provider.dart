import 'package:get/get.dart';
import 'package:wan_flutter/common/http/base_provider.dart';
import 'package:wan_flutter/pages/login/entity/userinfo.dart';

abstract class ILoginProvider {
  Future<UserEntity> login(String username, String password);
}

class LoginProvider extends BaseProvider implements ILoginProvider {
  @override
  Future<UserEntity> login(String username, String password) =>
      post('/user/login', FormData({"username": username, 'password': password}))
          .then((value) => value.toBean(UserEntity.fromJson));
}
