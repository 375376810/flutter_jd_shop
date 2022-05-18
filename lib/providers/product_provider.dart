import 'package:flutter/material.dart';
import 'package:flutterjdshop/model/product.dart';

class ProductProvider extends ChangeNotifier {
  Product currentProduct = Product("", "", "", 0);

  /*ProductProvider(String title, String desc, String url, double price) {
    currentProduct = Product(title, desc, url, price);
  }*/

  setCurrentProduct(Product product) {
    currentProduct = product;
    notifyListeners();
  }
}
