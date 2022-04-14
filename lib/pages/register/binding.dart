import 'package:get/get.dart';
import 'package:wan_flutter/pages/register/controller.dart';
import 'package:wan_flutter/pages/register/provider.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IRegisterProvider>(() => RegisterProvider());
    Get.lazyPut(() => RegisterController(Get.find()));
  }
}
