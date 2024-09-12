






import 'dart:ui';

import 'package:redux/redux.dart';


final localeReducer = combineReducers<Locale?>([
  TypedReducer<Locale?, RefreshLocaleAction>(_refresh).call,
]);

Locale? _refresh(Locale? locale, RefreshLocaleAction action) {
  locale = action.locale;
  return locale;
}

class RefreshLocaleAction {
  final Locale? locale;

  RefreshLocaleAction(this.locale);
}