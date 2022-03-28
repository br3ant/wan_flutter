import 'package:get/get.dart';
import 'package:wan_flutter/common/http/base_provider.dart';
import 'package:wan_flutter/common/http/base_response.dart';
import 'package:wan_flutter/pages/home/entity/article.dart';
import 'package:wan_flutter/pages/home/entity/banner.dart';

import 'provider.dart';

class HomeController extends GetxController {
  final ArticleProvider articleProvider;
  final BannerProvider bannerProvider;

  HomeController({required this.articleProvider, required this.bannerProvider});

  final banners = List<BannerBean>.empty(growable: true).obs;
  final articles = List<Article>.empty(growable: true).obs;
  final page = 0.obs;

  @override
  void onInit() {
    super.onInit();
    print("HomeController onInit");
    getBanners();
    getArticlePageList();
  }

  void getBanners() {
    bannerProvider
        .getBanners()
        .then((value) => banners.assignAll(value))
        .catchError((e) => {Get.snackbar("Error", e.toString())});
  }

  // 拉取文章列表
  Future<void> getArticlePageList() async {
    await articleProvider
        .getArticles(page.value)
        .then((value) => articles.addAll(value))
        .catchError((e) => {Get.snackbar("Error", e.toString())});
  }

  Future<void> reset() async {
    page.value = 0;
    articles.clear();
    getArticlePageList();
  }
}
