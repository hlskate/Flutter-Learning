

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MineSettingRoute extends StatefulWidget {

  const MineSettingRoute({super.key});

  @override
  _MineSettingRouteState createState() => _MineSettingRouteState();
}

class _MineSettingRouteState extends State<MineSettingRoute> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("设置"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView(
        children: <Widget>[
          _buildRows("账号与安全", null, true, 0),
          _buildRows("隐私设置", null, true, 1),
          _buildRows("青少年模式", "未开启", true, 2),
          _buildRows("深色模式", null, true, 3),
          _buildRows("清理缓存", "8.0M", false, 4),
          _buildRows("关于我们", "v2.6.0Debug", true, 5),
          _buildRows("主题设置", null, true, 6),
          _buildRows("多语言设置", null, true, 7),
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