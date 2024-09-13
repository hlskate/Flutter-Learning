
import 'package:flutter/material.dart';
import 'package:flutter_learning/common/localization/localization.dart';
import 'package:flutter_learning/common/tools/global_function.dart';

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
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
          title: Text(FLLocalizations.of(context).currentLocalized!.app_home_tab),
          backgroundColor: Theme.of(context).primaryColor,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          children: <Widget>[
            flImageNamed("home_top.jpeg"),
            flImageUrl("http://gips2.baidu.com/it/u=3944689179,983354166&fm=3028&app=3028&f=JPEG&fmt=auto?w=1024&h=1024"),
            flImageUrl("http://gips0.baidu.com/it/u=3557606594,2640240494&fm=3028&app=3028&f=JPEG&fmt=auto?w=2048&h=2048"),
            flImageUrl("http://gips3.baidu.com/it/u=1874299413,3253595329&fm=3028&app=3028&f=JPEG&fmt=auto?w=1920&h=2560"),
          ],
        )
      ),
    );
  }
}