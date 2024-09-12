

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class FLLoalizationDelegate extends LocalizationsDelegate<FLLocalizations> {
  FLLoalizationDelegate();

  @override
  bool isSupported(Locale locale) {
    // TODO: implement isSupported
    return ['en', 'zh'].contains(locale.languageCode);
  }

  @override
  Future<FLLocalizations> load(Locale locale) {
    return SynchronousFuture<FLLocalizations>(FLLocalizations(locale));
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<FLLocalizations> old) {
    // TODO: implement shouldReload
    return false;
  }

  /// 全局静态的代理
  static FLLoalizationDelegate delegate = FLLoalizationDelegate();
}

class FLLocalizations {
  final Locale locale;

  FLLocalizations(this.locale);

  /// 根据不同locale.languageCode加载不同语言对应
  static Map<String, FLStringBase> _localizedValues = {
    'en': new FLStringEn(),
    'zh': new FLStringZh(),
  };

  FLStringBase? get currentLocalized {
    return _localizedValues[locale.languageCode];
  }

  static FLLocalizations of(BuildContext context) {
    return Localizations.of(context, FLLocalizations);
  }
}

/// 语言实体基类
abstract class FLStringBase {
  late String app_name;
  late String theme1;
  late String theme2;
  late String theme3;
}

/// 语言实体实现类
class FLStringEn extends FLStringBase {
  @override
  String app_name = "Flutter_Learning";

  @override
  String theme1 = "Color1: brown";

  @override
  String theme2 = "Color2: blue";

  @override
  String theme3 = "Color3: tear";
}


class FLStringZh extends FLStringBase {
  @override
  String app_name = "学习Flutter";

  @override
  String theme1 = "主题1: 棕色";

  @override
  String theme2 = "主题2: 蓝色";

  @override
  String theme3 = "主题3: 绿色";
}


