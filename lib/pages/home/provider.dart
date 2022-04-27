import 'package:wan_flutter/common/http/base_provider.dart';
import 'package:wan_flutter/common/http/base_response.dart';
import 'package:wan_flutter/pages/entity/article.dart';
import 'package:wan_flutter/pages/entity/banner.dart';

abstract class IArticleProvider {
  Future<PageList<Article>> getArticles(int page);
}

abstract class IBannerProvider {
  Future<List<BannerBean>> getBanners();
}

class ArticleProvider extends BaseProvider implements IArticleProvider {
  // 文章分页
  @override
  Future<PageList<Article>> getArticles(int page) => get("/article/list/$page/json")
      .then((value) => value.toPageList(Article.fromJson));
}

class BannerProvider extends BaseProvider implements IBannerProvider {
  @override
  Future<List<BannerBean>> getBanners() =>
      get("/banner/json").then((value) => value.toList(BannerBean.fromJson));
}
