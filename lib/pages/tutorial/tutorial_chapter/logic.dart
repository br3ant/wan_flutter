import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan_flutter/common/base/get/controller/base_page_controller.dart';
import 'package:wan_flutter/common/utils/ext/refresher_extension.dart';
import 'package:wan_flutter/common/widget/pull_smart_refresher.dart';
import 'package:wan_flutter/pages/entity/article.dart';
import 'package:wan_flutter/pages/tutorial/provider.dart';

class TutorialChapterController extends BaseGetPageController {
  final ITutorialProvider provider;

  TutorialChapterController(this.provider);

  List<Article> chapters = [];

  @override
  void requestData(RefreshController controller, {Refresh refresh = Refresh.first}) {
    provider.getTutorialChapterList(Get.arguments, page).then((value) {
      RefreshExtension.onSuccess(controller, refresh, value.over);
      chapters.addAll(value.datas);
      showSuccess(chapters);
      update();
    }).catchError((e) {
      RefreshExtension.onError(controller, refresh);
      showError();
    });
  }
}
