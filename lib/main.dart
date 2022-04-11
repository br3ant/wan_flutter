import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_flutter/common/res/strings.dart';
import 'package:wan_flutter/common/routes/app_pages.dart';
import 'package:wan_flutter/pages/main/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      enableLog: true,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,

      ///国际化支持-来源配置
      translations: Messages(),
      ///国际化支持-默认语言
      locale: const Locale('zh', 'CN'),
      ///国际化支持-备用语言
      fallbackLocale: const Locale('en', 'US'),
    );
  }
}


