import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/product.dart';
import '../pages/login_page.dart';
import '../pages/order_list_page.dart';
import '../pages/product/product_page.dart';
import '../pages/search_page.dart';
import '../pages/sign_up_page.dart';
import '../pages/tabs/index_page.dart';
import '../providers/product_provider.dart';

//配置路由
final Map<String, Function> routes = {
  '/': (context) => const IndexPage(),
  '/search': (context) => const SearchPage(),
  '/product_details': (context) => const ProductPage(),
  '/login':(context) => const LoginPage(),
  '/sign_up':(context) => const SignUpPage(),
  '/order_list': (context, {arguments}) => OrderListPage(arguments: arguments),
};

//固定写法
Route routeGenerator(RouteSettings settings) {
  final String? name = settings.name;
  final Function? pageBuilder = routes[name];
  if (pageBuilder != null) {
    if (settings.arguments != null) {
      // 如果透传了参数
      return MaterialPageRoute(builder: (context) => pageBuilder(context, arguments: settings.arguments));
    } else {
      // 没有透传参数
      return MaterialPageRoute(builder: (context) => pageBuilder(context));
    }
  }
  return MaterialPageRoute(builder: (context) => const IndexPage());
}

///点击后进入详情页
goToDetaislPage(BuildContext context, Product currentProduct) {
  ProductProvider productProvider = Provider.of<ProductProvider>(context, listen: false);
  productProvider.setCurrentProduct(currentProduct);
  Navigator.pushNamed(context, '/product_details');
}
