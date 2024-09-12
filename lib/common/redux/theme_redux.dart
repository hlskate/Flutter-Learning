

// final themeDataReducer = comb


import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

final themeDataReducer = combineReducers<ThemeData?>([
  TypedReducer<ThemeData?, RefreshThemeDataAction>(_refresh).call,
]);


ThemeData? _refresh(ThemeData? themeData, action) {
  themeData = action.themeData;
  return themeData;
}

class RefreshThemeDataAction {
  final ThemeData themeData;

  RefreshThemeDataAction(this.themeData);
}