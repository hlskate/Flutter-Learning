

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'fl_string_base.dart';
import 'fl_string_en.dart';
import 'fl_string_zh.dart';

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


