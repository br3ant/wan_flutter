import 'package:get/get.dart';
import 'package:wan_flutter/pages/article/binding.dart';
import 'package:wan_flutter/pages/article/view.dart';
import 'package:wan_flutter/pages/home/bindings.dart';
import 'package:wan_flutter/pages/home/view.dart';
import 'package:wan_flutter/pages/main/index.dart';

class AppRoutes {
  static const main = '/main';
  static const article = '/article';
  static const home = '/home';
}

class AppPages {
  static const initial = AppRoutes.main;

  static final List<GetPage> routes = [
    GetPage(name: AppRoutes.main, page: () => const MainView()),
    GetPage(name: AppRoutes.article, page: () => ArticlePage(), binding: ArticleBinding()),
    GetPage(name: AppRoutes.home, page: () => HomePage(), binding: HomeBinding())
  ];
}
