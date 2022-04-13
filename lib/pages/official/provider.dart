import 'package:wan_flutter/common/http/base_provider.dart';
import 'package:wan_flutter/common/http/base_response.dart';
import 'package:wan_flutter/pages/home/entity/article.dart';
import 'package:wan_flutter/pages/official/entitys/OfficialTab.dart';

abstract class IOfficialProvider {
  Future getOfficialTabs();

  Future getOfficialList(String officialId, int page);
}

class OfficialProvider extends BaseProvider implements IOfficialProvider {
  @override
  Future getOfficialTabs() => get('/wxarticle/chapters/json').then((value) {
        var tabs = <OfficialTab>[];
        for (var data in value.toBaseResponse().data as List<dynamic>) {
          tabs.add(OfficialTab.fromJson(data));
        }
        return tabs;
      });

  @override
  Future getOfficialList(String officialId, int page) =>
      get('/wxarticle/list/$officialId/$page/json').then((value) =>
          PageList.formJson(
              value.toBaseResponse().data, (e) => Article.fromJson));
}
