
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_learning/common/localization/localization.dart';
import 'package:flutter_learning/models/index.dart';

class MineHeaderWidget extends StatelessWidget {

  MineHeaderWidget({super.key});
  var _screenWidth = 375.0;
  @override
  Widget build(BuildContext context) {

    _screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 300,
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage("static/images/home_top.jpeg"), fit: BoxFit.cover, opacity: 0.8),
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(padding: EdgeInsets.only(top: 60)),
            _settingButton(context),
            _mainInfoView(context),
            const Padding(padding: EdgeInsets.only(top: 10)),
            _friendInfoView(context),
          ],
      ),
    );
  }

  _settingButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: _screenWidth - 50),
      child: IconButton(
            onPressed: (){
              Navigator.pushNamed(context, "setting");
            },
            icon: Image(image: AssetImage("static/images/mine_top_setting_dark@2x.png"), width: 25, height: 25),
        ),
    );
  }

  _mainInfoView(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(globalStringBase(context).mine_tab_login, style: TextStyle(fontSize: 22, color: Colors.white)),
            Icon(Icons.arrow_right, size: 20),
          ],
        ),
        Text(globalStringBase(context).mine_tab_login_desc, style: TextStyle(fontSize: 14, color: Colors.white70)),
      ],
    );
  }

  _friendInfoView(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 80),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _friendInfoItems("0", globalStringBase(context).mine_tab_friend),
          _friendInfoItems("33", globalStringBase(context).mine_tab_attention),
          _friendInfoItems("22", globalStringBase(context).mine_tab_fans),
          _friendInfoItems("1", globalStringBase(context).mine_tab_vistor),
        ],
      ),
    );
  }

  _friendInfoItems(String count, String title) {
    return Container(
      width: _screenWidth / 4,
      height: 50.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Text(count, textAlign: TextAlign.center,style: const TextStyle(fontSize: 12, color: Colors.white)),
          ),
          const Padding(padding: EdgeInsets.only(top: 5)),
          Center(
            child: Text(title, textAlign: TextAlign.center, style: const TextStyle(fontSize: 14, color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

class MinePlayWidget extends StatelessWidget {

  var _screenWidth = 375.0;

  @override
  Widget build(BuildContext context) {
    _screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        color: Colors.white,
        height: 80,
        child: Row(
          children: <Widget>[
            _playItems("static/images/mine_bag_icon@2x.png", globalStringBase(context).mine_tab_daoju),
            _playItems("static/images/mine_dress_icon@2x.png", globalStringBase(context).mine_tab_dress),
            _playItems("static/images/ic_person_active_center@3x.png", globalStringBase(context).mine_tab_activityCenter),
            _playItems("static/images/ic_person_noble@2x.png", globalStringBase(context).mine_tab_noble),
          ],
        ),
      ),
    );
  }

  _playItems(String count, String title) {
    return Container(
      width: (_screenWidth - 20) / 4,
      height: 65.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Image(image: AssetImage(count), width: 40, height: 40),
          ),
          const Padding(padding: EdgeInsets.only(top: 5)),
          Center(
            child: Text(title, textAlign: TextAlign.center, style: const TextStyle(fontSize: 14, color: Colors.black)),
          ),
        ],
      ),
    );
  }
}

class MineMoneyWidget extends StatelessWidget {
  var _screenWidth = 375.0;
  @override
  Widget build(BuildContext context) {
    _screenWidth = MediaQuery.of(context).size.width;
    var _stringBase = globalStringBase(context);
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          color: Colors.white,
          height: 100,
          width: _screenWidth - 20,
          child: Row(
            children: <Widget>[
              _buildNineMoney(_stringBase.mine_tab_money, "990", _stringBase.mine_tab_wealthLevel, "---"),
              _buildNineMoney(_stringBase.mine_tab_moneyPoint, "0", _stringBase.mine_tab_specialLevel, "---"),
            ],
          ),
        ),
    );
  }

  _buildNineMoney(String title, String money,String levelTitle, String level) {
    var width = (_screenWidth - 20) / 2 - 1;
    return Container(
      width: width,
      height: 80,
      child: Column(
        children: <Widget>[
          Container(
            height: 35,
            child: Row(
              children: <Widget>[
                Container(
                  width: width / 2 - 0.5,
                  child: Padding(padding: EdgeInsets.only(left: 10), child: Text(title)),
                ),
                Container(
                  width: width / 2 - 0.5,
                  child: Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Text(
                          money,
                          textAlign: TextAlign.right,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)
                      ),
                  ),
                ),
                if (title.contains("余额"))
                  Container(
                    width: 1,
                    color: Colors.black,
                    height: 20,
                    padding: EdgeInsets.only(top: 5),
                  ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5),
            child: Container(
              color: Colors.deepOrangeAccent.shade100,
              height: 35,
              child: Row(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(left: 10), child: Text(levelTitle)),
                  Padding(padding: EdgeInsets.only(left: 55), child: Text(level,textAlign: TextAlign.right, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MineToolsWidget extends StatelessWidget {
  var _screenWidth = 375.0;
  @override
  Widget build(BuildContext context) {
    _screenWidth = MediaQuery.of(context).size.width;
    var _stringBase = globalStringBase(context);
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        color: Colors.white,
        width: _screenWidth - 20,
        child: Wrap(
          spacing: 0, // 主轴（水平方向间距）
          runSpacing: 5.0, // 纵轴（垂直）方向间距
          alignment: WrapAlignment.start,
          children: <Widget>[
            _buildToolsItem("static/images/tabbar_home.png", _stringBase.mine_tab_tool_roomManager),
            _buildToolsItem("static/images/tabbar_setting.png", _stringBase.mine_tab_tool_startLive),
            _buildToolsItem("static/images/tabbar_dynamic.png", _stringBase.mine_tab_tool_stealth),
            _buildToolsItem("static/images/tabbar_home.png", _stringBase.mine_tab_tool_helpCenter),
            _buildToolsItem("static/images/tabbar_setting.png", _stringBase.mine_tab_tool_dayTask),
            _buildToolsItem("static/images/tabbar_dynamic.png", _stringBase.mine_tab_tool_prop),
            _buildToolsItem("static/images/tabbar_home.png", _stringBase.mine_tab_tool_trueLove),
          ],
        ),
      ),
    );
  }

  _buildToolsItem(String iconName, String title) {
    return Container(
      width: (_screenWidth - 20) / 5,
      // height: 80.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 10)),
          Center(
            child: Image(image: AssetImage(iconName), width: 30, height: 30),
          ),
          const Padding(padding: EdgeInsets.only(top: 5)),
          Center(
            child: Text(title, textAlign: TextAlign.center, style: const TextStyle(fontSize: 14, color: Colors.black)),
          ),
          Padding(padding: EdgeInsets.only(top: 10)),
        ],
      ),
    );
  }
}
