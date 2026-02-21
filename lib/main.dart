import 'package:flutter/material.dart';

import 'package:flutterjdshop/providers/product_provider.dart';
import 'package:flutterjdshop/routers/Router.dart';
import 'package:flutterjdshop/widgets/my_colors.dart';
import 'package:provider/provider.dart';

// 引入自动生成的国际化类
import 'generated/l10n/app_localizations.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) {
            return ProductProvider();
          },
        )
      ],
      child: MaterialApp(
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        localeResolutionCallback: myLocaleResolutionCallback,
        theme: ThemeData(colorScheme: Theme.of(context).colorScheme.copyWith(primary: MyColors.mainBackgroundColor)),
        initialRoute: '/',
        onGenerateRoute: routeGenerator,
      ),
    );
  }

  Locale? myLocaleResolutionCallback(Locale? locale, Iterable<Locale> supportedLocales) {
    // 遍历支持的语言，匹配当前设备语言
    for (Locale supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale?.languageCode && supportedLocale.countryCode == locale?.countryCode) {
        return supportedLocale;
      }
    }
    // 无匹配时，默认使用英文
    return supportedLocales.first;
  }
}
