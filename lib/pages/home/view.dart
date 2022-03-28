import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';
import 'package:wan_flutter/common/components/space_header.dart';
import 'package:wan_flutter/common/routes/app_pages.dart';
import 'package:wan_flutter/pages/home/bindings.dart';
import 'package:wan_flutter/pages/home/controller.dart';
import 'package:wan_flutter/pages/home/entity/article.dart';
import 'package:wan_flutter/pages/home/entity/banner.dart';
import 'package:wan_flutter/pages/home/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  _HomePageState() {
    HomeBinding().dependencies();
  }

  @override
  Widget build(BuildContext context) {
    return const _HomePageGetX();
  }
}

class _HomePageGetX extends GetView<HomeController> {
  const _HomePageGetX({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() => Column(
          children: [
            _buildBanners(controller.banners),
            _buildArticleList(controller.articles),
          ],
        )),
      ),
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

  Widget _buildArticleList(articleList) {
    return Expanded(
      child: EasyRefresh(
        onRefresh: controller.reset,
        onLoad: controller.getArticlePageList,
        header: SpaceHeader(),
        child: ListView.separated(
          itemBuilder: (_, i) {
            return _buildArticle(articleList[i]);
          },
          separatorBuilder: (_, i) => const Divider(),
          itemCount: articleList.length,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
        ),
      ),
    );
  }

  Widget _buildArticle(Article article) => InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.article, arguments: article.link);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const SizedBox(width: 20),
              Text(
                article.author!,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
              const Spacer(),
              Text(
                article.niceDate!,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          Text(
            article.title!,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              Text(
                article.superChapterName!,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
              Text(
                article.chapterName!,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ));
}
