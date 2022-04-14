import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan_flutter/common/base/get/controller/base_page_controller.dart';
import 'package:wan_flutter/common/utils/ext/refresher_extension.dart';
import 'package:wan_flutter/common/widget/pull_smart_refresher.dart';
import 'package:wan_flutter/pages/entity/article.dart';
import 'package:wan_flutter/pages/official/provider.dart';

class OfficialController extends BaseGetPageController {
  final IOfficialProvider provider;
  final String officialId;

  OfficialController(this.provider, this.officialId);

  List<Article> articles = [];


  @override
  void requestData(RefreshController controller,
      {Refresh refresh = Refresh.first}) {
    provider.getOfficialList(officialId, page).then((value) {
      RefreshExtension.onSuccess(controller, refresh, value.over);

      ///下拉刷新需要清除列表
      if (refresh != Refresh.down) {
        articles.clear();
      }

      articles.addAll(value.datas);

      showSuccess(articles);

      update();
    }).catchError((e) {
      RefreshExtension.onError(controller, refresh);
      Get.snackbar("Error", e.toString());
    });
  }
}
