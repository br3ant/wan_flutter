import 'package:wan_flutter/common/http/base_provider.dart';
import 'package:wan_flutter/common/http/base_response.dart';
import 'package:wan_flutter/pages/entity/article.dart';
import 'package:wan_flutter/pages/entity/official_tab.dart';

abstract class IOfficialProvider {
  Future getOfficialTabs();

  Future<PageList<Article>> getOfficialList(String officialId, int page);
}

class OfficialProvider extends BaseProvider implements IOfficialProvider {
  @override
  Future getOfficialTabs() =>
      get('/wxarticle/chapters/json').then((value) => value.toList(OfficialTab.fromJson));

  @override
  Future<PageList<Article>> getOfficialList(String officialId, int page) =>
      get('/wxarticle/list/$officialId/$page/json')
          .then((value) => value.toPageList((Article.fromJson)));
}
