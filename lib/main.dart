import 'package:flutter/material.dart';
//import 'package:flutter_localizations/flutter_localizations.dart';
//import 'package:flutterjdshop/generated/l10n.dart';
import 'package:flutterjdshop/providers/product_provider.dart';
import 'package:flutterjdshop/routers/Router.dart';
import 'package:flutterjdshop/widgets/my_colors.dart';
import 'package:provider/provider.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
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
        // 1. 配置支持的语言列表（和 l10n.yaml 对应）
        supportedLocales: AppLocalizations.supportedLocales,
        // 2. 配置本地化代理（核心，加载翻译文案）
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        // 3. 配置语言解析规则（优先使用系统语言，无匹配则用默认）
        localeResolutionCallback: (locale, supportedLocales) {
          // 遍历支持的语言，匹配当前设备语言
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale?.languageCode &&
                supportedLocale.countryCode == locale?.countryCode) {
              return supportedLocale;
            }
          }
          // 无匹配时，默认使用英文
          return supportedLocales.first;
        },
        //localizationsDelegates: const [GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate, GlobalWidgetsLocalizations.delegate, S.delegate],
        //supportedLocales: S.delegate.supportedLocales,
        theme: ThemeData(colorScheme: Theme.of(context).colorScheme.copyWith(primary: MyColors.mainBackgroundColor)),
        initialRoute: '/',
        onGenerateRoute: routeGenerator,
      ),
    );
  }
}
