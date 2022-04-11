import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_flutter/common/base/get/get_common_view.dart';
import 'package:wan_flutter/common/base/get/get_save_state_view.dart';

import 'controller.dart';

class SquarePage extends GetSaveView<SquareController> {
  const SquarePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: Text('广场: ${controller.count}', style: const TextStyle(fontSize: 30))),
        floatingActionButton: FloatingActionButton(
          onPressed: () => controller
            ..count += 1
            ..update(),
          child: const Icon(Icons.add),
        ));
  }
}
