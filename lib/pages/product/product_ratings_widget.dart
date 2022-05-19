import 'package:flutter/material.dart';
import 'package:flutterjdshop/services/screen_adaptor.dart';

import '../../services/my_image_widget.dart';
import '../../config/basic_config.dart';
import '../../services/screen_adaptor.dart';

class ProductRatingsWidget extends StatefulWidget {
  const ProductRatingsWidget({Key? key}) : super(key: key);

  @override
  _ProductRatingsWidgetState createState() => _ProductRatingsWidgetState();
}

class _ProductRatingsWidgetState extends State<ProductRatingsWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          width: double.infinity,
          height: ScreenAdaptor.height(123),
          child: Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                  flex: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          height: ScreenAdaptor.height(42),
                          margin: EdgeInsets.only(left: ScreenAdaptor.width(20)),
                          child: Text(
                            "综合评分",
                            style: TextStyle(color: Colors.black87, fontSize: ScreenAdaptor.size(30)),
                          )),
                      Container(
                        height: ScreenAdaptor.height(42),
                        margin: EdgeInsets.only(left: ScreenAdaptor.width(18), top: ScreenAdaptor.width(5)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.star, color: Colors.orangeAccent, size: ScreenAdaptor.size(39)),
                            Icon(Icons.star, color: Colors.orangeAccent, size: ScreenAdaptor.size(39)),
                            Icon(Icons.star, color: Colors.orangeAccent, size: ScreenAdaptor.size(39)),
                            Icon(Icons.star, color: Colors.orangeAccent, size: ScreenAdaptor.size(39)),
                            Icon(Icons.star, color: Colors.orangeAccent, size: ScreenAdaptor.size(39)),
                            SizedBox(width: ScreenAdaptor.width(10)),
                            Text("5分", style: TextStyle(color: Colors.redAccent, fontSize: ScreenAdaptor.size(26)))
                          ],
                        ),
                      )
                    ],
                  )),
              Expanded(
                  flex: 2,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "查看更多",
                        style: TextStyle(color: Colors.redAccent, fontSize: ScreenAdaptor.size(30)),
                        textAlign: TextAlign.center,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: ScreenAdaptor.size(38),
                        color: Colors.redAccent,
                      ),
                      SizedBox(
                        width: ScreenAdaptor.width(10),
                      )
                    ],
                  ))
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: ScreenAdaptor.width(15)),
          height: ScreenAdaptor.height(98),
          child: Wrap(
            spacing: ScreenAdaptor.width(20),
            clipBehavior: Clip.hardEdge,
            runSpacing: ScreenAdaptor.width(0),
            children: [
              Chip(label: Text("是正品", style: TextStyle(color: Colors.black87, fontSize: ScreenAdaptor.size(26)))),
              Chip(label: Text("值得购买", style: TextStyle(color: Colors.black87, fontSize: ScreenAdaptor.size(26)))),
              Chip(label: Text("不错", style: TextStyle(color: Colors.black87, fontSize: ScreenAdaptor.size(26)))),
              Chip(label: Text("用料很高档", style: TextStyle(color: Colors.black87, fontSize: ScreenAdaptor.size(26)))),
            ],
          ),
        ),
        Divider(color: Colors.grey, thickness: ScreenAdaptor.height(1)),
        Container(
          margin: EdgeInsets.all(ScreenAdaptor.width(5)),
          height: ScreenAdaptor.height(260),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "买家晒单",
                style: TextStyle(fontSize: ScreenAdaptor.size(30), color: Colors.black87),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: ScreenAdaptor.height(10),
              ),
              SizedBox(
                height: ScreenAdaptor.height(200),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      margin: EdgeInsets.all(ScreenAdaptor.width(5)),
                      width: ScreenAdaptor.width(180),
                      child: MyImageWidget(BasicConfig.basicServerUrl + "images/buyer_gallery/buyer_gallery01.jpg"),
                    ),
                    Container(
                      margin: EdgeInsets.all(ScreenAdaptor.width(5)),
                      width: ScreenAdaptor.width(180),
                      child: MyImageWidget(BasicConfig.basicServerUrl + "images/buyer_gallery/buyer_gallery02.jpg"),
                    ),
                    Container(
                      margin: EdgeInsets.all(ScreenAdaptor.width(5)),
                      width: ScreenAdaptor.width(180),
                      child: MyImageWidget(BasicConfig.basicServerUrl + "images/buyer_gallery/buyer_gallery03.jpg"),
                    ),
                    Container(
                      margin: EdgeInsets.all(ScreenAdaptor.width(5)),
                      width: ScreenAdaptor.width(180),
                      child: MyImageWidget(BasicConfig.basicServerUrl + "images/buyer_gallery/buyer_gallery04.jpg"),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Divider(color: Colors.grey, thickness: ScreenAdaptor.height(1)),
        Container(
          height: ScreenAdaptor.height(580),
          color: Colors.red,
        ),
        SizedBox(
          height: ScreenAdaptor.height(130),
        ),
      ],
    );
  }
}
