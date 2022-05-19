import 'package:flutter/material.dart';

import '../../services/screen_adaptor.dart';

class ProductRatingsWidget extends StatefulWidget {
  const ProductRatingsWidget({Key? key}) : super(key: key);

  @override
  _ProductRatingsWidgetState createState() => _ProductRatingsWidgetState();
}

class _ProductRatingsWidgetState extends State<ProductRatingsWidget> {
  @override
  Widget build(BuildContext context) {
    ScreenAdaptor.init(context);
    return Container(
      width: 300,
      height: 200,
    );
  }
}
