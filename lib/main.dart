import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutterjdshop/generated/l10n.dart';
import 'package:flutterjdshop/providers/product_provider.dart';
import 'package:flutterjdshop/routers/Router.dart';
import 'package:flutterjdshop/widgets/my_colors.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

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
        localizationsDelegates: const [GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate, GlobalWidgetsLocalizations.delegate, S.delegate],
        supportedLocales: S.delegate.supportedLocales,
        theme: ThemeData(colorScheme: Theme.of(context).colorScheme.copyWith(primary: MyColors.mainBackgroundColor)),
        initialRoute: '/',
        onGenerateRoute: routeGenerator,
      ),
    );
  }
}
