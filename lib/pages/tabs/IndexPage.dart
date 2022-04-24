import 'package:flutter/material.dart';
import 'package:flutterjdshop/pages/tabs/CartPage.dart';
import 'package:flutterjdshop/pages/tabs/CategoryPage.dart';
import 'package:flutterjdshop/pages/tabs/HomePage.dart';
import 'package:flutterjdshop/pages/tabs/UserPage.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return IndexPageState();
  }
}

class IndexPageState extends State<IndexPage> {
  int currentIndex = 1;
  List pageList = [
    const HomePage(),
    const CategoryPage(),
    const CartPage(),
    const UserPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('仿京东商城'),
      ),
      body: pageList[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '主页'),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: '分类'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: '购物车'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: '我的')],
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index){
          setState(() {
            currentIndex = index;
          });
        },
        //fixedColor: Colors.red,
      ),
    );
  }
}
