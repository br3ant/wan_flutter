import 'package:get/get.dart';
import 'package:wan_flutter/pages/tutorial/tutorial_chapter/logic.dart';

class TutorialChapterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TutorialChapterController(Get.find()));
  }
}
