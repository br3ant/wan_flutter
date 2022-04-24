import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_flutter/common/base/get/get_common_view.dart';
import 'package:wan_flutter/common/widget/pull_smart_refresher.dart';
import 'package:wan_flutter/pages/widget/tutorial_view.dart';

import 'logic.dart';

class TutorialPage extends GetCommonView<TutorialController> {
  const TutorialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: RefreshWidget<TutorialController>(
        getController: controller,
        child: ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: controller.tutorialList.length,
            itemBuilder: (context, index) {
              return TutorialView(controller.tutorialList[index]);
            }),
      ),
    );
  }
}
