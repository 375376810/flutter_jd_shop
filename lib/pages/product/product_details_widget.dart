import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterjdshop/services/my_image_widget.dart';
import 'package:flutterjdshop/services/screen_adaptor.dart';
import 'package:flutterjdshop/widgets/my_colors.dart';
import 'package:provider/provider.dart';

import '../../config/basic_config.dart';
import '../../providers/product_provider.dart';

class ProductDetailsWidget extends StatefulWidget {
  const ProductDetailsWidget({Key? key}) : super(key: key);

  @override
  ProductDetailsWidgetState createState() => ProductDetailsWidgetState();
}

class ProductDetailsWidgetState extends State<ProductDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: ListView(
        children: [
          MyImageWidget(BasicConfig.basicServerUrl + productProvider.currentProduct!.url!),
          MyImageWidget(BasicConfig.basicServerUrl + productProvider.currentProduct!.url!),
          Text(productProvider.currentProduct!.desc!),
          Text(productProvider.currentProduct!.desc!),
          Text("￥${productProvider.currentProduct!.price}",style: TextStyle(color: MyColors.mainBackgroundColor,fontSize: 28),),
          SizedBox(
            height: ScreenAdaptor.height(200),
          )
        ],
      ),
    );
  }
}
