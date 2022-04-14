import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_flutter/common/base/get/get_common_view.dart';
import 'package:wan_flutter/common/res/button_style.dart';
import 'package:wan_flutter/common/res/colors.dart';
import 'package:wan_flutter/common/res/strings.dart';
import 'package:wan_flutter/common/res/style.dart';
import 'package:wan_flutter/common/routes/app_pages.dart';
import 'package:wan_flutter/common/utils/keyboard_util.dart';
import 'package:wan_flutter/pages/login/controller.dart';

class LoginPage extends GetCommonView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("登陆"),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              InputView(
                  hintText: "username",
                  onChanged: (s) => {
                        controller
                          ..account = s
                          ..update()
                      }),
              InputView(
                  hintText: "password",
                  onChanged: (s) {
                    controller
                      ..password = s
                      ..update();
                  }),
              Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.only(top: 36, left: 25, right: 25),
                child: TextButton(
                    style: controller.changeShowButton()
                        ? ButtonStyles.getButtonStyle()
                        : ButtonStyles.getTransparentStyle(),
                    onPressed: () {
                      KeyboardUtils.hideKeyboard(context);
                      controller.login();
                    },
                    child: Text(
                      "登陆",
                      style: controller.changeShowButton()
                          ? Styles.style_white_18
                          : Styles.style_white24_18,
                    )),
                decoration: BoxDecoration(
                  color: controller.changeShowButton()
                      ? ColorStyle.color_24CF5F
                      : ColorStyle.color_24CF5F_20,
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                ),
              ),

              ///注册按钮
              Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.only(top: 16, left: 25, right: 25),
                child: TextButton(
                    style: ButtonStyles.getButtonStyle(),
                    onPressed: () {
                      KeyboardUtils.hideKeyboard(context);
                      Get.toNamed(AppRoutes.register);
                    },
                    child: Text(
                      StringStyles.registerButton.tr,
                      style: Styles.style_white_18,
                    )),
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: const BorderRadius.all(Radius.circular(30)),
                  border: Border.all(color: Colors.white, width: 1),
                ),
              )
            ],
          ),
        ));
  }
}

class InputView extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> onChanged;

  InputView({required this.hintText, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 1,
      showCursor: true,
      decoration: InputDecoration(hintText: hintText),
      onChanged: onChanged,
    );
  }
}
