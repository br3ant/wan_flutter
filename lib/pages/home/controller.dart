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
    getBanners();
    getArticlePageList();
  }

  Future<void> getBanners() async {
    bannerProvider.getBanners().then((value) => {_replaceBanners(value.toBaseResponse())},
        onError: (e) {
      Get.snackbar("Error", e.toString());
    });
  }

  // 拉取文章列表
  Future<void> getArticlePageList() async {
    // 获取数据
    articleProvider.getArticles(page.value).then((value) => {_addArticle(value.toBaseResponse())},
        onError: (e) {
      Get.snackbar("Error", e.toString());
    });
  }

  Future<void> reset() async {
    page.value = 0;
    articles.clear();
    await getArticlePageList();
  }

  void _replaceBanners(BaseResponse baseResponse) {
    banners.assignAll((baseResponse.data as List<dynamic>).map((e) => BannerBean.fromJson(e)));
  }

  void _addArticle(BaseResponse baseResponse) {
    var data = PageList<Article>.formJson(baseResponse.data, Article.fromJson);
    articles.addAll(data.datas);
  }
}
