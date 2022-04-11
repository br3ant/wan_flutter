import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_flutter/common/res/button_style.dart';
import 'package:wan_flutter/common/res/colors.dart';
import 'package:wan_flutter/common/res/style.dart';
import 'package:wan_flutter/common/utils/keyboard_util.dart';
import 'package:wan_flutter/pages/login/controller.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("登陆"),
      ),
      body: SafeArea(
          child: GetBuilder<LoginController>(
        builder: (controller) => Container(
          width: double.infinity,
          height: double.infinity,
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
              )
            ],
          ),
        ),
      )),
    );
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
