import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan_flutter/common/base/get/controller/base_page_controller.dart';
import 'package:wan_flutter/common/http/base_provider.dart';
import 'package:wan_flutter/common/http/base_response.dart';
import 'package:wan_flutter/common/utils/ext/refresher_extension.dart';
import 'package:wan_flutter/common/widget/pull_smart_refresher.dart';
import 'package:wan_flutter/pages/home/entity/article.dart';
import 'package:wan_flutter/pages/home/entity/banner.dart';

import 'provider.dart';

class HomeController extends BaseGetPageController {
  final IArticleProvider articleProvider;
  final IBannerProvider bannerProvider;

  HomeController({required this.articleProvider, required this.bannerProvider});

  final banners = List<BannerBean>.empty(growable: true);
  final articles = List<Article>.empty(growable: true);

  @override
  void onInit() {
    super.onInit();
    print("HomeController onInit");
    getBanners();
  }

  @override
  void requestData(RefreshController controller, {Refresh refresh = Refresh.first}) {
    articleProvider.getArticles(page).then((value) {

      RefreshExtension.onSuccess(controller, refresh, value.over);

      ///下拉刷新需要清除列表
      if (refresh != Refresh.down) {
        articles.clear();
      }

      articles.addAll(value.datas);

      showSuccess(articles);

      update();
    }).catchError((e) => {Get.snackbar("Error", e.toString())});
  }

  void getBanners() {
    bannerProvider
        .getBanners()
        .then((value) => banners.assignAll(value))
        .catchError((e) => {Get.snackbar("Error", e.toString())});
  }
}
