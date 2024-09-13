// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homeMain.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeMain _$HomeMainFromJson(Map<String, dynamic> json) => HomeMain()
  ..hot = (json['hot'] as List<dynamic>?)
      ?.map((e) => Cover.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$HomeMainToJson(HomeMain instance) => <String, dynamic>{
      'hot': instance.hot,
    };
