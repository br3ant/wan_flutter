import 'package:get/get.dart';

import 'controller.dart';
import 'provider.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ArticleProvider>(() => ArticleProvider());
    Get.lazyPut<BannerProvider>(() => BannerProvider());
    Get.lazyPut<HomeController>(
        () => HomeController(articleProvider: Get.find(), bannerProvider: Get.find()));
  }
}
