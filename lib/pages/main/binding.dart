import 'package:get/get.dart';
import 'package:wan_flutter/pages/home/controller.dart';
import 'package:wan_flutter/pages/home/provider.dart';
import 'package:wan_flutter/pages/mine/controller.dart';
import 'package:wan_flutter/pages/mine/provider.dart';
import 'package:wan_flutter/pages/official/provider.dart';
import 'package:wan_flutter/pages/square/controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    //home
    Get.lazyPut<IArticleProvider>(() => ArticleProvider());
    Get.lazyPut<IBannerProvider>(() => BannerProvider());
    Get.lazyPut<HomeController>(() => HomeController(
        articleProvider: Get.find(), bannerProvider: Get.find()));

    //square
    Get.lazyPut<SquareController>(() => SquareController());

    //official
    Get.lazyPut<IOfficialProvider>(() => OfficialProvider());

    //mine
    Get.lazyPut<IMineProvider>(() => MineProvider());
    Get.lazyPut(() => MineController(Get.find()));
  }
}
