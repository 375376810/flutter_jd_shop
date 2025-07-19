import 'package:flutter/material.dart';
import 'package:flutterjdshop/services/screen_adaptor.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../services/my_image_widget.dart';
import '../../config/basic_config.dart';
import '../../widgets/my_colors.dart';

class ProductRatingsWidget extends StatefulWidget {
  const ProductRatingsWidget({Key? key}) : super(key: key);

  @override
  _ProductRatingsWidgetState createState() => _ProductRatingsWidgetState();
}

class _ProductRatingsWidgetState extends State<ProductRatingsWidget> {
  bool pressed1 = false;
  bool pressed2 = false;

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
                            Text("5分", style: TextStyle(color: MyColors.mainBackgroundColor, fontSize: ScreenAdaptor.size(26)))
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
                        style: TextStyle(color: MyColors.mainBackgroundColor, fontSize: ScreenAdaptor.size(30)),
                        textAlign: TextAlign.center,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: ScreenAdaptor.size(38),
                        color: MyColors.mainBackgroundColor,
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
                      child: MyImageWidget("${BasicConfig.basicServerUrl}images/buyer_gallery/buyer_gallery01.jpg"),
                    ),
                    Container(
                      margin: EdgeInsets.all(ScreenAdaptor.width(5)),
                      width: ScreenAdaptor.width(180),
                      child: MyImageWidget("${BasicConfig.basicServerUrl}images/buyer_gallery/buyer_gallery02.jpg"),
                    ),
                    Container(
                      margin: EdgeInsets.all(ScreenAdaptor.width(5)),
                      width: ScreenAdaptor.width(180),
                      child: MyImageWidget("${BasicConfig.basicServerUrl}images/buyer_gallery/buyer_gallery03.jpg"),
                    ),
                    Container(
                      margin: EdgeInsets.all(ScreenAdaptor.width(5)),
                      width: ScreenAdaptor.width(180),
                      child: MyImageWidget("${BasicConfig.basicServerUrl}images/buyer_gallery/buyer_gallery04.jpg"),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        Divider(color: Colors.grey, thickness: ScreenAdaptor.height(1)),
        SizedBox(
            height: ScreenAdaptor.height(580),
            child: Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.all(ScreenAdaptor.width(8)),
                    height: double.infinity,
                    alignment: Alignment.topCenter,
                    child: ClipOval(
                      child: Image.asset("images/user1.jpg", fit: BoxFit.cover, width: ScreenAdaptor.width(60), height: ScreenAdaptor.height(60)),
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Column(
                    children: [
                      SizedBox(
                        height: ScreenAdaptor.height(60),
                        child: Flex(
                          direction: Axis.horizontal,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "小*****花",
                                    style: TextStyle(fontSize: ScreenAdaptor.size(25), color: Colors.black54),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        if (pressed1 = !pressed1) {
                                          Fluttertoast.showToast(msg: "点赞成功");
                                        }
                                      });
                                    },
                                    icon: Icon(Icons.thumb_up, size: ScreenAdaptor.size(36)),
                                    color: pressed1 ? Colors.red : Colors.grey,
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.more_horiz,
                                      color: Colors.grey,
                                    ),
                                    iconSize: ScreenAdaptor.size(36),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: ScreenAdaptor.height(50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.star, color: Colors.orangeAccent, size: ScreenAdaptor.size(29)),
                            Icon(Icons.star, color: Colors.orangeAccent, size: ScreenAdaptor.size(29)),
                            Icon(Icons.star, color: Colors.orangeAccent, size: ScreenAdaptor.size(29)),
                            Icon(Icons.star, color: Colors.orangeAccent, size: ScreenAdaptor.size(29)),
                            Icon(Icons.star, color: Colors.orangeAccent, size: ScreenAdaptor.size(29)),
                          ],
                        ),
                      ),
                      Container(
                        height: ScreenAdaptor.height(50),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "型号:自拆卸式,XXXL,白色,大号",
                          style: TextStyle(
                            fontSize: ScreenAdaptor.size(26),
                            color: Colors.black54,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: ScreenAdaptor.height(10),
                      ),
                      SizedBox(
                        height: ScreenAdaptor.height(138),
                        child: const Text(
                          "一开始还担心会不合适,这个还真心不错,昨天四点多倒满一杯热水,现在是第二天10点,喝到嘴里还是热的,保温效果nice",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.black87),
                        ),
                      ),
                      SizedBox(
                        height: ScreenAdaptor.height(200),
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Container(
                              margin: EdgeInsets.all(ScreenAdaptor.width(5)),
                              width: ScreenAdaptor.width(180),
                              child: MyImageWidget("${BasicConfig.basicServerUrl}images/buyer_gallery/buyer_gallery01.jpg"),
                            ),
                            Container(
                              margin: EdgeInsets.all(ScreenAdaptor.width(5)),
                              width: ScreenAdaptor.width(180),
                              child: MyImageWidget("${BasicConfig.basicServerUrl}images/buyer_gallery/buyer_gallery02.jpg"),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: ScreenAdaptor.height(50),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "03-04-2022 22:35",
                          style: TextStyle(color: Colors.black38, fontSize: ScreenAdaptor.size(23)),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )),
        Divider(color: Colors.grey, thickness: ScreenAdaptor.height(1)),
        SizedBox(
            height: ScreenAdaptor.height(580),
            child: Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.all(ScreenAdaptor.width(8)),
                    height: double.infinity,
                    alignment: Alignment.topCenter,
                    child: ClipOval(
                      child: Image.asset("images/user2.jpg", fit: BoxFit.cover, width: ScreenAdaptor.width(60), height: ScreenAdaptor.height(60)),
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Column(
                    children: [
                      SizedBox(
                        height: ScreenAdaptor.height(60),
                        child: Flex(
                          direction: Axis.horizontal,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "张*****三",
                                    style: TextStyle(fontSize: ScreenAdaptor.size(25), color: Colors.black54),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        if (pressed2 = !pressed2) {
                                          Fluttertoast.showToast(msg: "点赞成功");
                                        }
                                      });
                                    },
                                    icon: Icon(Icons.thumb_up, size: ScreenAdaptor.size(36)),
                                    color: pressed2 ? Colors.red : Colors.grey,
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.more_horiz,
                                      color: Colors.grey,
                                    ),
                                    iconSize: ScreenAdaptor.size(36),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: ScreenAdaptor.height(50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.star, color: Colors.orangeAccent, size: ScreenAdaptor.size(29)),
                            Icon(Icons.star, color: Colors.orangeAccent, size: ScreenAdaptor.size(29)),
                            Icon(Icons.star, color: Colors.orangeAccent, size: ScreenAdaptor.size(29)),
                            Icon(Icons.star, color: Colors.orangeAccent, size: ScreenAdaptor.size(29)),
                            Icon(Icons.star, color: Colors.orangeAccent, size: ScreenAdaptor.size(29)),
                          ],
                        ),
                      ),
                      Container(
                        height: ScreenAdaptor.height(50),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "型号:不可拆卸式,XL,红色,小号",
                          style: TextStyle(
                            fontSize: ScreenAdaptor.size(26),
                            color: Colors.black54,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: ScreenAdaptor.height(10),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        height: ScreenAdaptor.height(60),
                        child: const Text(
                          "此用户没有填写评价",
                          maxLines: 3,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Colors.black87),
                        ),
                      ),
                      SizedBox(
                        height: ScreenAdaptor.height(200),
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Container(
                              margin: EdgeInsets.all(ScreenAdaptor.width(5)),
                              width: ScreenAdaptor.width(180),
                              child: MyImageWidget("${BasicConfig.basicServerUrl}images/buyer_gallery/buyer_gallery03.jpg"),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: ScreenAdaptor.height(50),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "03-04-2022 22:35",
                          style: TextStyle(color: Colors.black38, fontSize: ScreenAdaptor.size(23)),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )),
        SizedBox(
          height: ScreenAdaptor.height(130),
        ),
      ],
    );
  }
}
