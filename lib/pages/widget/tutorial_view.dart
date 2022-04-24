import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_flutter/common/res/style.dart';
import 'package:wan_flutter/common/routes/app_pages.dart';
import 'package:wan_flutter/common/widget/ripple_widget.dart';
import 'package:wan_flutter/pages/tutorial/entity/tutorial_entity.dart';

class TutorialView extends StatelessWidget {
  final TutorialEntity tutorial;

  const TutorialView(this.tutorial, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: Ripple(
            onTap: () => Get.toNamed(AppRoutes.tutorialChapter,
                arguments: tutorial.id.toString()),
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(children: [
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    SizedBox(
                      width: 81,
                      height: 114,
                      child: Image.network(tutorial.cover!),
                    ),
                    Box.hBox10,
                    Expanded(
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Box.vBox10,
                      Text(
                        tutorial.name!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.style_black_16_bold,
                      ),
                      Box.vBox10,
                      Text(
                        "作者:" + tutorial.author!,
                        style: Styles.style_FE8C28_11,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Box.vBox10,
                      Text(
                        tutorial.desc!,
                        style: Styles.style_FE8C28_11,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Box.vBox10,
                    ]))
                  ]),
                  DividerStyle.divider1Half
                ]))));
  }
}
