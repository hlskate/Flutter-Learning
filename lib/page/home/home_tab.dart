
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_learning/common/localization/localization.dart';
import 'package:flutter_learning/common/request/network.dart';
import 'package:flutter_learning/common/tools/global_function.dart';
import 'package:flutter_learning/models/cover.dart';
import 'package:flutter_learning/page/home/home_coverCell.dart';

import '../../models/homeMain.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  HomeTabState createState() => HomeTabState();

}

class HomeTabState extends State<HomeTab> with AutomaticKeepAliveClientMixin<HomeTab> {
  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _requestHomeData();
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  final _homeData = <Cover>[];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    print("首页->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
    return Scaffold(
      appBar: AppBar(
          title: Text(FLLocalizations.of(context).currentLocalized!.app_home_tab),
          backgroundColor: Theme.of(context).primaryColor,
      ),
      backgroundColor: Colors.white,
      body: _buildBody(),
    );
  }

  _buildBody() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: _homeData.length,
      itemBuilder: (context, index) {
        if (index == _homeData.length - 1 && _homeData.length < 200) {
          _requestHomeData();
        }
        return HomeCoverCell(_homeData[index]);
      },
    );


    return Center(
      child: ListView.separated(
        itemBuilder: (context, index) {
          return HomeCoverCell(_homeData[index]);
        },
        separatorBuilder: (context, index) => const Divider(height: 0),
        itemCount: _homeData.length,
      ),
    );
  }

  _requestHomeData() async {
    var resp = await NetWork(context).getUrl("v2/main");
    final parsed = jsonEncode(resp.data['data']);
    Map<String,dynamic> par = jsonDecode(parsed);
    var list = HomeMain.fromJson(par).hot;
    setState(() {
      final length = _homeData.isNotEmpty ? _homeData.length - 1 : 0;
      _homeData.insertAll(length, list as Iterable<Cover>);
    });
  }
}