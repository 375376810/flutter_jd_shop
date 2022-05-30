import 'dart:convert';

import 'package:flutterjdshop/model/shopping_cart_product.dart';
import 'package:flutterjdshop/services/storage_service.dart';

class ShoppingCartService {
  ///添加到购物车
  static Future<bool> addToCart(ShoppingCartProduct shoppingCartProduct) async {
    //转换成Json
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = shoppingCartProduct.title;
    data['desc'] = shoppingCartProduct.desc;
    data['url'] = shoppingCartProduct.url;
    data['price'] = shoppingCartProduct.price;
    data['size'] = shoppingCartProduct.size;
    data['color'] = shoppingCartProduct.color;
    data['quantity'] = shoppingCartProduct.quantity;
    //从本地配置文件中读取已有的购物车数据
    List shoppingCartList = [];
    try {
      String? val = await StorageService.getString('shopping_cart_list');
      if (val != null) {
        shoppingCartList = json.decode(val);
        //判断当前data是否已在本地(重复)
        bool isDuplicated = shoppingCartList.any((element) {
          return element['title'] == data['title'] &&
              element['desc'] == data['desc'] &&
              element['url'] == data['url'] &&
              element['price'] == data['price'] &&
              element['size'] == data['size'] &&
              element['color'] == data['color'];
        });
        if (isDuplicated) {
          for (var element in shoppingCartList) {
            if (element['title'] == data['title'] &&
                element['desc'] == data['desc'] &&
                element['url'] == data['url'] &&
                element['price'] == data['price'] &&
                element['size'] == data['size'] &&
                element['color'] == data['color']) {
              //如果有重复,则将两个Item的数量相加
              element['quantity'] += data['quantity'];
            }
          }
        } else {
          //如果没有重复,则添加
          shoppingCartList.add(data);
        }
      }
      //重新写入本地配置文件
      StorageService.setString('shopping_cart_list', json.encode(shoppingCartList));
    } catch (e) {
      print("ShoppingCartService.addToCart()异常 : " + e.toString());
      return false;
    }
    return true;
  }

  ///获取购物车列表
  static Future<List<ShoppingCartProduct>> getShopppingCartList() async {
    List<ShoppingCartProduct> shoppingCartList = [];
    try {
      String? val = await StorageService.getString('shopping_cart_list');
      if (val != null) {
        List data = json.decode(val);
        for (var element in data) {
          ShoppingCartProduct shoppingCartProduct = ShoppingCartProduct.fromJson(element);
          shoppingCartList.add(shoppingCartProduct);
        }
      }
    } catch (e) {
      print(e);
      shoppingCartList = [];
    }
    return shoppingCartList;
  }

  ///清空购物车
  static void clearShoppingCart() {
    StorageService.remove('shopping_cart_list');
  }

  ///添加很多数据
  static Future<bool> addListToCart(List<ShoppingCartProduct> shoppingCartList) async {
    try {
      StorageService.setString('shopping_cart_list', json.encode(shoppingCartList));
    } catch(e) {
      print(e);
      return false;
    }
    return true;
  }
}
