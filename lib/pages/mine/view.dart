import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_flutter/common/base/get/get_save_state_view.dart';
import 'package:wan_flutter/common/res/shadow_style.dart';
import 'package:wan_flutter/common/res/style.dart';
import 'package:wan_flutter/common/routes/app_pages.dart';

import 'controller.dart';

class MinePage extends GetSaveView<MineController> {
  const MinePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.all(20),
        child: Container(
          decoration: ShadowStyle.white12Circle(),
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              _avatar(),
              const Spacer(),
              controller.userInfo == null
                  ? GestureDetector(
                      child: const Text("还未登陆，点击登陆", style: Styles.style_1A2F51_14),
                      onTap: () => controller.navigation2Login())
                  : Text(controller.userInfo?.username ?? "")
            ],
          ),
        ));
  }

  Widget _avatar() {
    if (controller.userInfo == null) {
      return const CircleAvatar(
          radius: 30, backgroundImage: AssetImage("assets/images/avatar.png"));
    } else {
      return CircleAvatar(radius: 30, backgroundImage: NetworkImage(controller.userInfo!.icon));
    }
  }
}
