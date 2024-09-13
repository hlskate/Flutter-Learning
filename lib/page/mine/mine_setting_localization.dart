
import 'package:flutter/material.dart';
import 'package:flutter_learning/Common/redux/FLState.dart';
import 'package:flutter_learning/common/tools/common_tools.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../common/localization/localization.dart';

class MineSettingLocalizationRoute extends StatefulWidget {
  const MineSettingLocalizationRoute({super.key});

  @override
  _MineSettingLocalizationRouteState createState() => _MineSettingLocalizationRouteState();
}

class _MineSettingLocalizationRouteState extends State<MineSettingLocalizationRoute> {
  @override
  Widget build(BuildContext context) {
    var _localized = FLLocalizations.of(context).currentLocalized!;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(globalStringBase(context).mine_setting_language),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView(
        children: <Widget>[
          _buildListItem("中文", 1),
          _buildListItem("English", 2),
        ],
      ),
    );
  }

  _buildListItem(String title, int index) {
    return ListTile(
      title: Text(title),
      onTap: () {
        CommonTools.changeLocale(StoreProvider.of<FLState>(context), index);
      },
    );
  }
}