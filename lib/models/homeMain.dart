import 'package:json_annotation/json_annotation.dart';
import "cover.dart";
part 'homeMain.g.dart';

@JsonSerializable()
class HomeMain {
  HomeMain();

  List<Cover>? hot;
  
  factory HomeMain.fromJson(Map<String,dynamic> json) => _$HomeMainFromJson(json);
  Map<String, dynamic> toJson() => _$HomeMainToJson(this);
}
