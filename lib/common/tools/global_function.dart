
import 'package:flutter/cupertino.dart';

Widget flImageNamed(String name) {
  return Image(image: AssetImage("static/images/$name"));
}

Widget flImageUrl(String url) {
  return Image.network(url);
}