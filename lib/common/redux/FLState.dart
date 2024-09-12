import 'package:flutter/material.dart';
import 'package:flutter_learning/models/index.dart';
import 'package:redux/redux.dart';
import 'package:flutter_learning/common/redux/user_redux.dart';
import 'theme_redux.dart';
import 'locale_redux.dart';

/// 全局Redux store对象，保存State数据
class FLState {
  /// 用户信息
  User? userInfo;

  /// 主题
  ThemeData? themeData;

  ///当前手机平台默认语言
  Locale? platformLocale;

  /// 语言
  Locale? locale;

  /// 构造方法
  FLState({this.userInfo, this.themeData, this.locale});
}

/// 创建Reducer
/// 源码中Reducer是一个方法 typedef State Reducer<State>(State state, dynamic action);
/// 我们自定义了appReducer用于创建store
FLState appReducer(FLState state, action) {
  return FLState(
    /// 用过自定义UserReducer将FLState内的userInfo和action关联在一起
    userInfo: userReducer(state.userInfo, action),
    /// 通过自定义的ThemeDataReducer将FLState内的themeData和action关联在一起
    themeData: themeDataReducer(state.themeData, action),
    /// 通过自定义LoaleReducer将FLState内的loacle和action关联在一起
    locale: localeReducer(state.locale, action),
  );
}