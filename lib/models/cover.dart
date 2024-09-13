import 'package:json_annotation/json_annotation.dart';

part 'cover.g.dart';

@JsonSerializable()
class Cover {
  Cover();

  String? nickname;
  String? signature;
  String? phonehallposter;
  
  factory Cover.fromJson(Map<String,dynamic> json) => _$CoverFromJson(json);
  Map<String, dynamic> toJson() => _$CoverToJson(this);
}
