

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_learning/common/localization/localization.dart';

class MineSettingRoute extends StatefulWidget {

  const MineSettingRoute({super.key});

  @override
  _MineSettingRouteState createState() => _MineSettingRouteState();
}

class _MineSettingRouteState extends State<MineSettingRoute> {

  @override
  Widget build(BuildContext context) {

    var _stringBase = globalStringBase(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(globalStringBase(context).mine_setting_name),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView(
        children: <Widget>[
          _buildRows(_stringBase.mine_setting_account, null, true, 0),
          _buildRows(_stringBase.mine_setting_privacy, null, true, 1),
          _buildRows(_stringBase.mine_setting_young, "未开启", true, 2),
          _buildRows(_stringBase.mine_setting_darkMode, null, true, 3),
          _buildRows(_stringBase.mine_setting_clearCache, "8.0M", false, 4),
          _buildRows(_stringBase.mine_setting_aboutUs, "v2.6.0Debug", true, 5),
          _buildRows(_stringBase.mine_setting_theme, null, true, 6),
          _buildRows(_stringBase.mine_setting_language, null, true, 7),
        ],
      )
    );
  }

  _buildRows(String title, String? rightTitle, bool needNext, int index) {
    return ListTile(
      title: Text(title),
      onTap: () {
        _clickIndex(index);
      },
    );
  }

  _clickIndex(int index) {
    switch (index) {
      case 0:
        // 账号与安全
        break;
      case 1:
      // 隐私设置
        break;
      case 2:
      // 青少年模式
        break;
      case 3:
      // 深色模式
        break;
      case 4:
      // 清理缓存
        break;
      case 5:
      // 关于我们
        break;
      case 6:
      // 主题设置
        Navigator.of(context).pushNamed("setting_theme");
        break;
      case 7:
      // 多语言设置
        Navigator.of(context).pushNamed("setting_localization");
        break;
    }
  }
}