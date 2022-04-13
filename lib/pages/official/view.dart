import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_flutter/common/base/get/controller/base_page_controller.dart';
import 'package:wan_flutter/common/base/get/get_common_view.dart';
import 'package:wan_flutter/common/res/colors.dart';
import 'package:wan_flutter/common/res/style.dart';
import 'package:wan_flutter/common/widget/pull_smart_refresher.dart';
import 'package:wan_flutter/common/widget/ripple_widget.dart';
import 'package:wan_flutter/pages/official/entitys/OfficialTab.dart';
import 'package:wan_flutter/pages/official/provider.dart';
import 'package:wan_flutter/pages/widget/article_view.dart';

import 'controller.dart';

class OfficialPage extends StatefulWidget {
  const OfficialPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _OfficialPageState();
}

class _OfficialPageState extends State<OfficialPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  List<OfficialTab> tabs = [];

  @override
  void initState() {
    super.initState();
    getOfficialTabs();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController?.dispose();
  }

  void getOfficialTabs() {
    Get.find<IOfficialProvider>().getOfficialTabs().then((value) {
      setState(() {
        _tabController = TabController(length: value.length, vsync: this);
        tabs.assignAll(value);
      });
    }).catchError((e) {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: [
          TabBar(
              isScrollable: true,
              labelColor: ColorStyle.color_24CF5F,
              unselectedLabelColor: ColorStyle.color_B8C0D4,
              controller: _tabController,
              labelStyle: Styles.style_FE8C28_24_bold,
              unselectedLabelStyle: Styles.style_FFAE2E_16,
              tabs: tabs.map((e) => Tab(text: e.name!)).toList()),
          TabBarView(children: ['1'].map((e) => _OfficialTabView(e)).toList())
        ],
      ),
    );
  }
}

class _OfficialTabView extends GetCommonView<OfficialController> {
  final String officialId;

  _OfficialTabView(this.officialId, {Key? key}) : super(key: key) {
    Get.lazyPut(() => OfficialController(Get.find(), officialId),
        tag: officialId);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      color: Colors.white,
      child: RefreshWidget<OfficialController>(
        child: ListView.builder(
            itemBuilder: (context, index) => Material(
                color: Colors.transparent,
                child: Ripple(
                  onTap: () => {},
                  child: MainArticleView(controller.articles[index]),
                ))),
      ),
    ));
  }
}
