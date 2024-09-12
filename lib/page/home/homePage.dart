

import 'package:flutter/material.dart';
import 'package:flutter_learning/common/redux/user_redux.dart';
import 'package:flutter_learning/common/tools/common_tools.dart';
import 'package:flutter_learning/common/tools/localization.dart';
import 'package:flutter_learning/models/index.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../Common/redux/FLState.dart';

class HomePageRoute extends StatefulWidget {
  const HomePageRoute({super.key});

  @override
  _HomePageRouteState createState() => _HomePageRouteState();
}

class _HomePageRouteState extends State<HomePageRoute> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(FLLocalizations.of(context).currentLocalized?.app_name ?? "Flutter项目"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView(
        children: <Widget>[
          _buildItem(FLLocalizations.of(context).currentLocalized!.theme1, Colors.red, 0),
          _buildItem(FLLocalizations.of(context).currentLocalized!.theme2, Colors.blueGrey, 1),
          _buildItem(FLLocalizations.of(context).currentLocalized!.theme3, Colors.yellow, 2),
          _buildLocal("中文", 1),
          _buildLocal("English", 2),
        ],
      ),
    );
  }

  Widget _buildItem(String lan, Color color, int index) {
    return ListTile(
      title: Text(lan, style: const TextStyle(color: Colors.black)),
      onTap: () {
        CommonTools.pushTheme(StoreProvider.of<FLState>(context), index);
      },
    );
  }

  Widget _buildLocal(String lan, int index) {
    return ListTile(
      title: Text(lan),
      onTap: () {
        CommonTools.changeLocale(StoreProvider.of<FLState>(context), index);
      },
    );
  }
}