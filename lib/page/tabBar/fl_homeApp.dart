

import 'package:flutter_learning/Common/redux/FLState.dart';
import 'package:flutter_learning/main.dart';
import 'package:flutter_learning/models/index.dart';
import 'package:flutter_learning/page/mine/mine_setting_localization.dart';
import 'package:flutter_learning/page/mine/mine_setting_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:redux/redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../mine/mine_setting.dart';
import '../tabBar/homePage.dart';
import 'package:flutter_learning/common/localization/localization.dart';

class FLHomeApp extends StatefulWidget {
  const FLHomeApp({super.key});

  @override
  _FLHomeAppState createState() => _FLHomeAppState();
}


class _FLHomeAppState extends State<FLHomeApp> {

  // 创建Store, 引用FLState中的appReducer创建Reducer
  // initialState 初始化State
  final store = Store<FLState>(
    appReducer,
    initialState: FLState(
      userInfo: User(),
      themeData: ThemeData(primarySwatch: Colors.grey),
      locale: const Locale('zh', 'CH'),
    ),

  );

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StoreProvider(
      store: store,
      child: StoreBuilder<FLState>(builder: (context, store) {
        /// 使用StoreBuilder获取store中的theme、locale
        Widget app = MaterialApp(
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            FLLoalizationDelegate.delegate,
          ],
          locale: store.state.locale,
          supportedLocales: [store.state.locale ?? store.state.platformLocale ?? const Locale('en', 'US')],
          theme: store.state.themeData,
          routes: <String, WidgetBuilder>{
            "homePage": (context) => const HomePageRoute(),
            "MyApp": (context) => const MyApp(),
            "setting": (context) => const MineSettingRoute(),
            "setting_theme": (context) => const MineSettingThemeRoute(),
            "setting_localization": (context) => const MineSettingLocalizationRoute(),
          },
          home: const HomePageRoute(),
        );

        return app;
      }),
      );
  }
}