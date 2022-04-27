import 'package:get/get.dart';
import 'package:wan_flutter/common/http/base_provider.dart';
import 'package:wan_flutter/pages/login/entity/userinfo.dart';

abstract class IMineProvider {
  Future getUserInfo();
}

class MineProvider extends BaseProvider implements IMineProvider {
  @override
  Future getUserInfo() {
    return get('user/lg/userinfo/json')
        .then((value) => value.toBean(UserEntity.fromJson));
  }
}
