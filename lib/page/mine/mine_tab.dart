

import 'package:flutter/material.dart';
import 'package:flutter_learning/common/localization/localization.dart';
import 'package:flutter_learning/page/mine/widget/mine_header.dart';
class MineTab extends StatefulWidget {
  const MineTab({super.key});

  @override
  MineTabState createState() => MineTabState();
}

class MineTabState extends State<MineTab> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MineHeaderWidget(),
          MinePlayWidget(),
          MineMoneyWidget(),
          MineToolsWidget(),
        ],
      ),
    );
  }
}