import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticlePage extends GetView {
  final link = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WebView(
        onWebViewCreated: (_) => link != null
            ? Get.dialog(const CupertinoActivityIndicator())
            : Get.snackbar("Error", "link url is null"),
        onPageStarted: (_) {},
        onPageFinished: (_) {
          if (Get.isDialogOpen == false || Get.isSnackbarOpen == false) {
            Get.back();
          }
        },
        initialUrl: link,
      ),
    );
  }
}
