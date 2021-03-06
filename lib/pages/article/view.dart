import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_flutter/common/base/get/get_common_view.dart';
import 'package:wan_flutter/pages/article/controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticlePage extends GetCommonView<ArticleController> {
  const ArticlePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WebView(
        initialUrl: Get.arguments,
        javascriptMode: JavascriptMode.unrestricted,
        onProgress: (pro) {
          controller.progress.value = (pro / 100).toDouble();
        },
      ),
    );
  }
}
