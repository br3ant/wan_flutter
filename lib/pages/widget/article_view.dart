import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:wan_flutter/common/res/style.dart';
import 'package:wan_flutter/common/routes/app_pages.dart';
import 'package:wan_flutter/common/widget/ripple_widget.dart';
import 'package:wan_flutter/pages/entity/article.dart';

class MainArticleView extends StatelessWidget {
  final Article article;

  const MainArticleView(this.article, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: Ripple(
            onTap: () => Get.toNamed(AppRoutes.article, arguments: article.link),
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Box.vBox10,
                    Text(
                      article.title!,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.style_black_16_bold,
                    ),
                    Box.vBox10,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          article.superChapterName!,
                          style: Styles.style_FE8C28_11,
                        ),
                        Text(
                          article.chapterName!,
                          style: Styles.style_FE8C28_11,
                        ),
                        Box.hBox10,
                        const Text(
                          '|',
                          style: Styles.style_9F9EA6_11,
                        ),
                        Box.hBox10,
                        Text(
                          article.shareUser!.isEmpty ? article.author! : article.shareUser!,
                          style: Styles.style_9F9EA6_11,
                        ),
                        Box.hBox10,
                        Text(article.niceDate!, style: Styles.style_9F9EA6_11)
                      ],
                    ),
                    Box.vBox10,
                    DividerStyle.divider1Half
                  ],
                ))));
  }
}
