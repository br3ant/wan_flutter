import 'package:get/get.dart';
import 'package:wan_flutter/common/http/base_provider.dart';
import 'package:wan_flutter/common/http/base_response.dart';
import 'package:wan_flutter/pages/home/entity/article.dart';

abstract class IArticleProvider {
  Future<Response> getArticles(int page);
}

abstract class IBannerProvider {
  Future<Response> getBanners();
}

class ArticleProvider extends BaseProvider implements IArticleProvider {
  // 文章分页
  @override
  Future<Response> getArticles(int page) => get("/article/list/$page/json");
}

class BannerProvider extends BaseProvider implements IBannerProvider {
  @override
  Future<Response> getBanners() => get("/banner/json");
}
