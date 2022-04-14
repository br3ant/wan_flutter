import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_flutter/common/base/get/get_common_view.dart';
import 'package:wan_flutter/common/res/button_style.dart';
import 'package:wan_flutter/common/res/colors.dart';
import 'package:wan_flutter/common/res/r.dart';
import 'package:wan_flutter/common/res/strings.dart';
import 'package:wan_flutter/common/res/style.dart';
import 'package:wan_flutter/common/utils/keyboard_util.dart';
import 'package:wan_flutter/pages/widget/edit_widget.dart';

import 'controller.dart';

class RegisterPage extends GetCommonView<RegisterController> {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(StringStyles.registerButton.tr)),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(R.assetsImagesLoginBackground), fit: BoxFit.cover)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ///账户名输入框
                EditWidget(
                  iconWidget: const Icon(
                    Icons.perm_identity,
                    color: Colors.white,
                  ),
                  hintText: StringStyles.loginAccountNameHint.tr,
                  onChanged: (text) => controller
                    ..account = text
                    ..update(),
                ),

                ///密码输入框
                EditWidget(
                  iconWidget: const Icon(Icons.lock_open, color: Colors.white),
                  hintText: StringStyles.loginAccountPwdHint.tr,
                  passwordType: true,
                  onChanged: (text) => controller
                    ..password = text
                    ..update(),
                ),

                ///再次输入密码输入框
                EditWidget(
                  iconWidget: const Icon(Icons.lock_open, color: Colors.white),
                  hintText: StringStyles.loginAccountRePwdHint.tr,
                  passwordType: true,
                  onChanged: (text) => controller
                    ..rePassword = text
                    ..update(),
                ),

                ///注册按钮
                Container(
                  width: double.infinity,
                  height: 50,
                  margin: const EdgeInsets.only(top: 16, left: 25, right: 25),
                  child: TextButton(
                      style: controller.changeShowButton()
                          ? ButtonStyles.getButtonStyle()
                          : ButtonStyles.getTransparentStyle(),
                      onPressed: () {
                        KeyboardUtils.hideKeyboard(context);
                        controller.register();
                      },
                      child: Text(
                        StringStyles.registerButton.tr,
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
              ],
            ),
          ),
        ));
  }
}
