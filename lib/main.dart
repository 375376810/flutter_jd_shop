import 'package:flutter/material.dart';
import 'package:flutterjdshop/routers/Router.dart';

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
    //更改主色料为PANTONE 17-3938
    return MaterialApp(
      theme: ThemeData(colorScheme: Theme.of(context).colorScheme.copyWith(primary: const Color.fromRGBO(102, 103, 171, 1))),
      initialRoute: '/',
      onGenerateRoute: routeGenerator,
    );
  }
}
