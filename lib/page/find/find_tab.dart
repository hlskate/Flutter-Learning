
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learning/common/localization/localization.dart';
import 'package:flutter_learning/common/request/network.dart';
import 'package:flutter_learning/models/homeMain.dart';

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
      body: Center(
        child: Container(
          color: Colors.red,
          width: 100,
          height: 100,
          child: FadeInImage.assetNetwork(
            image: "http://gips3.baidu.&h=1280",
            placeholder: "static/images/home_top.jpeg",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}