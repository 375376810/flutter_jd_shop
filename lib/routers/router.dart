import 'package:flutter/material.dart';

import '../pages/search_page.dart';
import '../pages/tabs/index_page.dart';


//配置路由
final Map<String, Function> routes = {
  '/': (context) => const IndexPage(),
  '/search': (context) => const SearchPage(),
};

//固定写法
Route routeGenerator(RouteSettings settings) {
  final String? name = settings.name;
  final Function? pageBuilder = routes[name];
  if (pageBuilder != null) {
    if (settings.arguments != null) {
      // 如果透传了参数
      return MaterialPageRoute(
          builder: (context) =>
              pageBuilder(context, arguments: settings.arguments));
    } else {
      // 没有透传参数
      return MaterialPageRoute(builder: (context) => pageBuilder(context));
    }
  }
  return MaterialPageRoute(builder: (context) => const IndexPage());
}
