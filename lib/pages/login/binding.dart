import 'package:get/get.dart';
import 'package:wan_flutter/pages/login/controller.dart';
import 'package:wan_flutter/pages/login/provider.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginProvider());
    Get.lazyPut(() => LoginController(provider: Get.find()));
  }
}
