import 'package:get/get.dart';
import 'package:wan_flutter/pages/register/controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterBinding());
    Get.lazyPut(() => RegisterController(provider: Get.find()));
  }
}
