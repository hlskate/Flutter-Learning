

import 'package:flutter/material.dart';
import 'package:flutter_learning/common/redux/user_redux.dart';
import 'package:flutter_learning/common/tools/common_tools.dart';
import 'package:flutter_learning/common/localization/localization.dart';
import 'package:flutter_learning/models/index.dart';
import 'package:flutter_learning/page/charge/charge_tab.dart';
import 'package:flutter_learning/page/find/find_tab.dart';
import 'package:flutter_learning/page/home/home_tab.dart';
import 'package:flutter_learning/page/mine/mine_tab.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../Common/redux/FLState.dart';

class HomePageRoute extends StatefulWidget {
  const HomePageRoute({super.key});

  @override
  _HomePageRouteState createState() => _HomePageRouteState();
}

class _HomePageRouteState extends State<HomePageRoute> with SingleTickerProviderStateMixin {

  final PageController _pageController = PageController();
  final GlobalKey<HomeTabState> homeKey = GlobalKey();
  final GlobalKey<FindTabState> findKey = GlobalKey();
  final GlobalKey<ChargeTabState> chargeKey = GlobalKey();
  final GlobalKey<MineTabState> mineKey = GlobalKey();
  final List<Widget> tabs = <Widget>[];
  var _index = 0;
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4)..addListener(() {
      switch (_tabController?.index) {

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(), // 禁用滑动功能
        controller: _pageController,
        children: _tabViews(),
        onPageChanged: (index) {
          // _tabBarChanged(index);
        },
      ),
      bottomNavigationBar: Material(
        color: Colors.white,
        child: TabBar(
          labelColor: Theme.of(context).primaryColor,
          unselectedLabelColor: Colors.grey,
          labelStyle: TextStyle(fontWeight: FontWeight.bold),
          indicatorColor: Colors.white,
          tabs: _tabItems(),
          controller: _tabController,
          onTap: _tabBarChanged,
        ),
      ),
    );
  }


  _tabViews() {
    return <Widget>[
      HomeTab(key: homeKey),
      FindTab(key: findKey),
      ChargeTab(key: chargeKey),
      MineTab(key: mineKey),
    ];
  }

  _renderTab(icon, text) {
    return Tab(
      text: text,
      icon: icon,
    );


    return Tab(
      /// 这个高度需要适配底部安全距离
      height: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          const Padding(padding: EdgeInsets.only(top: 3)),
          icon,
          const Padding(padding: EdgeInsets.only(top: 2)),
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14.0, color: Colors.black)),
        ],
      ),
    );
  }

  _tabItems() {
    var current = FLLocalizations.of(context).currentLocalized!;
    return <Widget>[
      _renderTab(Image(image: AssetImage("static/images/tabbar_home.png"), width: 26, height: 26), current.app_home_tab),
      _renderTab(Image(image: AssetImage("static/images/tabbar_dynamic.png"),width: 26, height: 26), current.app_find_tab),
      _renderTab(Image(image: AssetImage("static/images/tabbar_calendar.png"),width: 26, height: 26), current.app_charge_tab),
      _renderTab(Image(image: AssetImage("static/images/tabbar_setting.png"),width: 26, height: 26), current.app_mine_tab),
    ];
  }

  _tabBarChanged(index) {
    // 页面触摸作用滑动回调，用于同步tab选中状态
    if (_index == index) {
      return;
    }
    _index = index;
    _pageController.jumpTo(MediaQuery.sizeOf(context).width * index);
    // _tabController!.animateTo(index);
  }
}