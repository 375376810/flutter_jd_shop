import 'package:flutter/material.dart';
import 'package:flutterjdshop/pages/tabs/user_page.dart';
import 'package:flutterjdshop/services/user_service.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'category_page.dart';
import 'home_page.dart';
import 'shopping_cart_page.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return IndexPageState();
  }
}

class IndexPageState extends State<IndexPage> {
  int currentIndex = 0;
  List<Widget> pageList = [const HomePage(), const CategoryPage(), const ShoppingCartPage(), const UserPage()];
  late PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller,
        children: pageList,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '主页'),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: '分类'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: '购物车'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: '我的')
        ],
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          jump(index);
        },
      ),
    );
  }

  void jump(index) async{
    //当进入购物车和用户中心页面时先判断登录状态
    if (index == 2 || index == 3) {
      if (!await UserService.isLogin()) {
        Fluttertoast.showToast(msg: "请先登录");
        //打开登录页面
        Navigator.pushNamed(context, '/login');
        return;
      }
    }
    setState(() {
      controller.jumpToPage(index);
      currentIndex = index;
    });
  }
}
