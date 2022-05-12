import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class MyImageWidget extends StatelessWidget {

  MyImageWidget(this.url, {Key? key}) : super(key: key);
  ///图片加载类型:1.带缓存的加载方式 2.普通网络图片加载方式
  int type = 2;
  String url;

  @override
  Widget build(BuildContext context) {
    Widget widget = Container();
    switch (type) {
      case 1:
        widget = CachedNetworkImage(
            fit: BoxFit.fill,
            imageUrl: url,
            //placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error));
        break;
      case 2:
        widget = Image.network(
          url,
          fit: BoxFit.fill,
        );
        break;
    }
    return widget;
  }
}
