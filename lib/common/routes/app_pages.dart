import 'package:get/get.dart';
import 'package:wan_flutter/pages/article/binding.dart';
import 'package:wan_flutter/pages/article/view.dart';
import 'package:wan_flutter/pages/login/binding.dart';
import 'package:wan_flutter/pages/login/view.dart';
import 'package:wan_flutter/pages/main/binding.dart';
import 'package:wan_flutter/pages/main/index.dart';
import 'package:wan_flutter/pages/register/binding.dart';
import 'package:wan_flutter/pages/register/view.dart';
import 'package:wan_flutter/pages/tutorial/tutorial_chapter/binding.dart';
import 'package:wan_flutter/pages/tutorial/tutorial_chapter/view.dart';

class AppRoutes {
  static const main = '/main';
  static const article = '/article';
  static const home = '/home';
  static const login = '/login';
  static const register = '/register';
  static const tutorialChapter = '/tutorialChapter';
}

class AppPages {
  static const initial = AppRoutes.main;

  static final List<GetPage> routes = [
    GetPage(name: AppRoutes.main, page: () => const MainView(), binding: MainBinding()),
    GetPage(name: AppRoutes.article, page: () => const ArticlePage(), binding: ArticleBinding()),
    GetPage(name: AppRoutes.login, page: () => const LoginPage(), binding: LoginBinding()),
    GetPage(name: AppRoutes.register, page: () => const RegisterPage(), binding: RegisterBinding()),
    GetPage(
        name: AppRoutes.tutorialChapter,
        page: () => TutorialChapterPage(),
        binding: TutorialChapterBinding()),
  ];
}
