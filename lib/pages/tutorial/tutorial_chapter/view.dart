import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_flutter/common/base/get/get_common_view.dart';
import 'package:wan_flutter/common/res/style.dart';
import 'package:wan_flutter/common/routes/app_pages.dart';
import 'package:wan_flutter/common/widget/pull_smart_refresher.dart';
import 'package:wan_flutter/common/widget/ripple_widget.dart';

import 'logic.dart';

class TutorialChapterPage extends GetCommonView<TutorialChapterController> {
  const TutorialChapterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: RefreshWidget<TutorialChapterController>(
        getController: controller,
        child: ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: controller.chapters.length,
            itemBuilder: (context, index) {
              final chapter = controller.chapters[index];
              return Material(
                  color: Colors.transparent,
                  child: Ripple(
                      onTap: () => Get.toNamed(AppRoutes.article, arguments: chapter.link),
                      child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${index + 1}. ${chapter.title!}",
                                style: Styles.style_black_18_bold,
                              ),
                              Box.vBox5
                            ],
                          ))));
            }),
      ),
    ));
  }
}
