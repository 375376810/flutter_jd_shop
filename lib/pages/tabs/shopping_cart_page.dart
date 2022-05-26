import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterjdshop/services/screen_adaptor.dart';
import 'package:flutterjdshop/services/shopping_cart_service.dart';

import '../../model/shopping_cart_product.dart';

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ShoppingCartPageState();
  }
}

class ShoppingCartPageState extends State {
  List<ShoppingCartProduct> shoppingCartProductList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //每次build时,通过本地文件查到所有购物车Item
    initCartList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('购物车'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.red,
        child: Column(
          children: [
            Container(
              color: Colors.white,
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  ShoppingCartService.clearShoppingCart();
                },
                child: const Text("清空购物车"),
              ),
            ),
            Container(
              height: 300,
              width: double.infinity,
              color: Colors.green,
              child: ListView.builder(
                itemCount: shoppingCartProductList.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: ScreenAdaptor.height(100),
                    color: Colors.blue,
                    child: ListTile(
                      leading: Text(shoppingCartProductList[index].desc!),
                      trailing: Text(shoppingCartProductList[index].price.toString()),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void initCartList() async {
    var list = await ShoppingCartService.getShopppingCartList();
    setState(() {
      shoppingCartProductList = list;
    });
    print("初始化购物车...");
    print(shoppingCartProductList.toString());
    print("总数量 : " + shoppingCartProductList.length.toString());
    print(shoppingCartProductList[0].title);
    print(shoppingCartProductList[0].desc);
    print(shoppingCartProductList[0].price);
  }
}
