

import 'package:flutter/material.dart';
import 'package:flutter_learning/models/cover.dart';

class HomeCoverCell extends StatefulWidget {

  HomeCoverCell(this.cover) : super(key: ValueKey(cover.nickname));

  final Cover cover;

  @override
  _HomeCoverCellState createState() => _HomeCoverCellState();
}

class _HomeCoverCellState extends State<HomeCoverCell> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final image = FadeInImage.assetNetwork(
        image: widget.cover.phonehallposter ?? "",
      placeholder: "static/images/home_top.jpeg",
      fit: BoxFit.cover,
    ).image;
    final width = (MediaQuery.of(context).size.width - 40) / 2;
    return Container(
      margin: const EdgeInsets.all(10),
      width: width,
      height: width,
      decoration: BoxDecoration(
        image: DecorationImage(image: image),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: width - 20), child: Text(widget.cover.nickname ?? "")),
        ],
      ),
    );
  }
}