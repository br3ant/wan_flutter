import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class MinePage extends StatelessWidget {

  final count = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(child: Obx(() => Text('我的: $count', style: const TextStyle(fontSize: 30)))),
        floatingActionButton: FloatingActionButton(
          onPressed: ()=>{count.value++},
          child: const Icon(Icons.add),
        ));
  }
}
