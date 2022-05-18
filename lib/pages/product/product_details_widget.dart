import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterjdshop/providers/product_provider.dart';
import 'package:flutterjdshop/services/my_image_widget.dart';
import 'package:provider/provider.dart';

import '../../config/basic_config.dart';

class ProductDetailsWidget extends StatefulWidget {
  const ProductDetailsWidget({Key? key}) : super(key: key);

  @override
  _ProductDetailsWidgetState createState() => _ProductDetailsWidgetState();
}

class _ProductDetailsWidgetState extends State<ProductDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: ListView(
        children: [MyImageWidget(BasicConfig.basicServerUrl + productProvider.currentProduct.url), Text(productProvider.currentProduct.desc), Text("${productProvider.currentProduct.price}")],
      ),
    );
  }
}
