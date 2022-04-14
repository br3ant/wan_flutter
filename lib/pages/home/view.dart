import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:get/get.dart';
import 'package:wan_flutter/common/base/get/get_save_state_view.dart';
import 'package:wan_flutter/common/widget/pull_smart_refresher.dart';
import 'package:wan_flutter/pages/entity/banner.dart';
import 'package:wan_flutter/pages/home/controller.dart';
import 'package:wan_flutter/pages/widget/article_view.dart';

class HomePage extends GetSaveView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshWidget<HomeController>(
      getController: controller,
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
              return MainArticleView(article);
            }
          }),
    );
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
}
