
import 'package:flutter/material.dart';
import 'package:flutter_learning/Common/redux/FLState.dart';
import 'package:flutter_learning/common/localization/localization.dart';
import 'package:flutter_learning/common/tools/common_tools.dart';
import 'package:flutter_redux/flutter_redux.dart';

class MineSettingThemeRoute extends StatefulWidget {
  const MineSettingThemeRoute({super.key});

  @override
  _MineSettingThemeRouteState createState() => _MineSettingThemeRouteState();
}

class _MineSettingThemeRouteState extends State<MineSettingThemeRoute> {

  @override
  Widget build(BuildContext context) {
    var _localized = FLLocalizations.of(context).currentLocalized!;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(globalStringBase(context).mine_setting_theme),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView(
        children: <Widget>[
          _buildListItem(_localized.theme1, 0),
          _buildListItem(_localized.theme2, 1),
          _buildListItem(_localized.theme3, 2),
        ],
      ),
    );
  }

  _buildListItem(String title, int index) {
    return ListTile(
      title: Text(title),
      onTap: () {
        CommonTools.pushTheme(StoreProvider.of<FLState>(context), index);
      },
    );
  }
}