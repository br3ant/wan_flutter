import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:get/get.dart';
import 'package:wan_flutter/common/base/get/get_save_state_view.dart';
import 'package:wan_flutter/common/res/style.dart';
import 'package:wan_flutter/common/routes/app_pages.dart';
import 'package:wan_flutter/common/widget/pull_smart_refresher.dart';
import 'package:wan_flutter/common/widget/ripple_widget.dart';
import 'package:wan_flutter/pages/home/controller.dart';
import 'package:wan_flutter/pages/home/entity/article.dart';
import 'package:wan_flutter/pages/home/entity/banner.dart';

class HomePage extends GetSaveView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            top: true,
            child: Container(
                color: Colors.white,
                child: RefreshWidget<HomeController>(
                  child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: controller.articles.length + 1,
                      itemBuilder: (BuildContext context, int index) {
                        ///将Banner装载到ListView中
                        if (index == 0) {
                          return _buildBanners(controller.banners);
                        } else {
                          final article = controller.articles[index - 1];
                          return Material(
                              color: Colors.transparent,
                              child: Ripple(
                                  onTap: () =>
                                      Get.toNamed(AppRoutes.article, arguments: article.link),
                                  child: _buildArticle(article)));
                        }
                      }),
                ))));
  }

  Widget _buildBanners(List<BannerBean> banners) {
    return SizedBox(
      height: Get.height / 4,

      ///轮播图控件
      child: Swiper(
        key: UniqueKey(),
        itemCount: banners.length,
        itemBuilder: (_, i) => Image.network("${banners[i].imagePath}", fit: BoxFit.cover),
        autoplay: true,
        pagination: const SwiperPagination(
          alignment: Alignment.bottomRight,
          builder: DotSwiperPaginationBuilder(
            activeSize: 10,
            size: 6,
            activeColor: Colors.blue,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget _buildArticle(Article article) => Container(
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
      ));
}
