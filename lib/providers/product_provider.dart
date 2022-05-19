import 'package:flutter/material.dart';
import 'package:flutterjdshop/model/product.dart';

class ProductProvider extends ChangeNotifier {
  Product? currentProduct ;

  setCurrentProduct(Product product) {
    currentProduct = product;
    notifyListeners();
  }
}
