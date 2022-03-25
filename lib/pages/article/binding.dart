import 'package:get/get.dart';
import 'package:wan_flutter/pages/article/controller.dart';

class ArticleBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ArticleController());
  }
}