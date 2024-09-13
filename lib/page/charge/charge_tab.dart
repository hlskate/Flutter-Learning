

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learning/common/localization/localization.dart';

class ChargeTab extends StatefulWidget {
  const ChargeTab({super.key});

  @override
  ChargeTabState createState() => ChargeTabState();
}

class ChargeTabState extends State<ChargeTab> with AutomaticKeepAliveClientMixin {

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          title: Text(FLLocalizations.of(context).currentLocalized!.app_charge_tab),
          backgroundColor: Theme.of(context).primaryColor,
      ),
      backgroundColor: Colors.green,
    );
  }
}