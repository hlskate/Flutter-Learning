
import 'package:flutter/material.dart';
import 'package:flutter_learning/common/localization/localization.dart';

class FindTab extends StatefulWidget {
  const FindTab({super.key});

  @override
  FindTabState createState() => FindTabState();
}

class FindTabState extends State<FindTab> with AutomaticKeepAliveClientMixin {
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          title: Text(FLLocalizations.of(context).currentLocalized!.app_find_tab),
          backgroundColor: Theme.of(context).primaryColor,
      ),
      backgroundColor: Colors.yellow,
    );
  }
}