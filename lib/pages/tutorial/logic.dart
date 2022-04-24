import 'package:get/get.dart';
import 'package:pull_to_refresh/src/smart_refresher.dart';
import 'package:wan_flutter/common/base/get/controller/base_page_controller.dart';
import 'package:wan_flutter/common/utils/ext/refresher_extension.dart';
import 'package:wan_flutter/common/widget/pull_smart_refresher.dart';
import 'package:wan_flutter/pages/tutorial/entity/tutorial_entity.dart';
import 'package:wan_flutter/pages/tutorial/provider.dart';

class TutorialController extends BaseGetPageController {
  final ITutorialProvider provider;

  TutorialController(this.provider);

  List<TutorialEntity> tutorialList = [];

  @override
  void requestData(RefreshController controller, {Refresh refresh = Refresh.first}) {
    provider.getTutorialList().then((value) {
      RefreshExtension.onSuccess(controller, refresh, true);
      tutorialList.assignAll(value);
      showSuccess(tutorialList);
      update();
    }).catchError((e) {
      RefreshExtension.onError(controller, refresh);
    });
  }
}
