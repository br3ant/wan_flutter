import 'package:flutter/material.dart';
import 'package:wan_flutter/pages/home/view.dart';
import 'package:wan_flutter/pages/mine/view.dart';
import 'package:wan_flutter/pages/official/view.dart';
import 'package:wan_flutter/pages/square/view.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MainViewState();
  }
}

class _MainViewState extends State<MainView> {
  final items = [
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
    const BottomNavigationBarItem(icon: Icon(Icons.square), label: '广场'),
    // const BottomNavigationBarItem(icon: Icon(Icons.person), label: '公众号'),
    const BottomNavigationBarItem(icon: Icon(Icons.person), label: '我的')
  ];

  final bodyList = [HomePage(), SquarePage(), MinePage()];

  final pageController = PageController();

  int currentIndex = 0;

  void onTap(int index) {
    pageController.jumpToPage(index);
  }

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: PageView(
            controller: pageController,
            onPageChanged: onPageChanged,
            children: bodyList,
            physics: const NeverScrollableScrollPhysics(), // 禁止滑动
          ),
        ),
        bottomNavigationBar:
            BottomNavigationBar(items: items, currentIndex: currentIndex, onTap: onTap));
  }
}
