import 'package:flutter/material.dart';
import 'package:flutterjdshop/generated/l10n.dart';
import 'package:flutterjdshop/services/my_image_widget.dart';
import 'package:flutterjdshop/services/screen_adaptor.dart';
import 'package:flutterjdshop/services/shopping_cart_service.dart';
import 'package:flutterjdshop/widgets/my_colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../config/basic_config.dart';
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
    super.initState();
    //每次build时,通过本地文件查到所有购物车Item
    initCartList();
  }

  @override
  Widget build(BuildContext context) {
    //初始化屏幕适配750*1344
    ScreenAdaptor.init(context);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              S.current.shopping_cart_page_gouwuche,
              style: TextStyle(fontSize: ScreenAdaptor.size(41), color: Colors.white),
            ),
            Text(
              "(${shoppingCartProductList.length})",
              style: TextStyle(fontSize: ScreenAdaptor.size(29), color: Colors.white70),
            ),
            SizedBox(
              width: ScreenAdaptor.width(58),
            ),
            Text(
              "降价",
              style: TextStyle(fontSize: ScreenAdaptor.size(31), color: Colors.white54),
            ),
            SizedBox(
              width: ScreenAdaptor.width(58),
            ),
            Text(
              "常购",
              style: TextStyle(fontSize: ScreenAdaptor.size(31), color: Colors.white54),
            ),
          ],
        ),
        actions: [
          Container(
            width: ScreenAdaptor.width(80),
            alignment: Alignment.center,
            child: Text(
              "更多",
              style: TextStyle(fontSize: ScreenAdaptor.size(31), color: Colors.white54),
            ),
          ),
        ],
      ),
      body: Flex(
        direction: Axis.vertical,
        children: [
          Expanded(
            flex: 21,
            child: ListView.builder(
              itemCount: shoppingCartProductList.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: double.infinity,
                  height: ScreenAdaptor.height(258),
                  margin: EdgeInsets.all(ScreenAdaptor.size(10)),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(ScreenAdaptor.size(16)),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12, // 阴影的颜色
                        offset: Offset(10, 10), // 阴影与容器的距离
                        blurRadius: 18.0, // 高斯的标准偏差与盒子的形状卷积。
                        spreadRadius: 0.0, // 在应用模糊之前，框应该膨胀的量。
                      ),
                    ],
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Flex(
                    direction: Axis.horizontal,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          padding: EdgeInsets.all(ScreenAdaptor.size(5)),
                          alignment: Alignment.center,
                          child: Checkbox(
                            onChanged: (bool? value) {},
                            value: true,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 8,
                        child: Container(
                          padding: EdgeInsets.all(ScreenAdaptor.size(5)),
                          alignment: Alignment.center,
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Container(
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(ScreenAdaptor.size(10)),
                              ),
                              child: MyImageWidget(BasicConfig.basicServerUrl + shoppingCartProductList[index].url!),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 15,
                        child: Container(
                          padding: EdgeInsets.all(ScreenAdaptor.size(5)),
                          child: Flex(
                            direction: Axis.vertical,
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      shoppingCartProductList[index].desc!,
                                      maxLines: 1,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: ScreenAdaptor.size(28),
                                      ),
                                    ),
                                  )),
                              Expanded(
                                  flex: 2,
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      shoppingCartProductList[index].size! + "   " + shoppingCartProductList[index].color!,
                                      maxLines: 1,
                                      overflow: TextOverflow.clip,
                                      style: TextStyle(
                                        color: Colors.black38,
                                        fontSize: ScreenAdaptor.size(27),
                                      ),
                                    ),
                                  )),
                              Expanded(
                                  flex: 3,
                                  child: Flex(
                                    direction: Axis.horizontal,
                                    children: [
                                      Expanded(
                                          flex: 7,
                                          child: Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              "  ¥" + shoppingCartProductList[index].price!.toStringAsFixed(2),
                                              style: TextStyle(
                                                color: MyColors.mainBackgroundColor,
                                                fontSize: ScreenAdaptor.size(35),
                                              ),
                                            ),
                                          )),
                                      Expanded(
                                          flex: 3,
                                          child: Container(
                                            alignment: Alignment.centerRight,
                                            child: Container(
                                              padding: EdgeInsets.all(ScreenAdaptor.size(10)),
                                              clipBehavior: Clip.hardEdge,
                                              decoration: BoxDecoration(
                                                border: Border.all(color: Colors.grey, width: ScreenAdaptor.size(1)),
                                                borderRadius: BorderRadius.circular(ScreenAdaptor.size(6)),
                                                color: Colors.black12,
                                              ),
                                              child: Text(
                                                "×${shoppingCartProductList[index].quantity}",
                                                style: TextStyle(
                                                  color: Colors.black87,
                                                  fontSize: ScreenAdaptor.size(28),
                                                ),
                                              ),
                                            ),
                                          )),
                                      Expanded(
                                          flex: 3,
                                          child: Container(
                                              alignment: Alignment.centerRight,
                                              child: IconButton(
                                                icon: Icon(
                                                  Icons.delete,
                                                  color: MyColors.mainBackgroundColor,
                                                  size: ScreenAdaptor.size(63),
                                                ),
                                                onPressed: () {
                                                  //删除此项
                                                  showDialog(
                                                      context: context,
                                                      builder: (BuildContext context) => AlertDialog(
                                                            title: Text(
                                                              '删除',
                                                              style: TextStyle(fontSize: ScreenAdaptor.size(36)),
                                                            ),
                                                            content: Wrap(
                                                              direction: Axis.horizontal,
                                                              children: [
                                                                Text(
                                                                  "确认要删除 ",
                                                                  style: TextStyle(fontSize: ScreenAdaptor.size(30)),
                                                                ),
                                                                Container(
                                                                  constraints: BoxConstraints(
                                                                    maxWidth: ScreenAdaptor.width(280),
                                                                  ),
                                                                  child: Text(
                                                                    shoppingCartProductList[index].desc!,
                                                                    maxLines: 1,
                                                                    style: TextStyle(
                                                                      fontSize: ScreenAdaptor.size(30),
                                                                      color: Colors.black54,
                                                                      overflow: TextOverflow.ellipsis,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Text(
                                                                  "这个宝贝吗?",
                                                                  style: TextStyle(fontSize: ScreenAdaptor.size(30)),
                                                                ),
                                                              ],
                                                            ),
                                                            actions: [
                                                              OutlinedButton(
                                                                  onPressed: () {
                                                                    Navigator.pop(context);
                                                                  },
                                                                  child: Text(
                                                                    '取消',
                                                                    style: TextStyle(fontSize: ScreenAdaptor.size(30)),
                                                                  )),
                                                              OutlinedButton(
                                                                  onPressed: () {
                                                                    shoppingCartProductList.removeAt(index);
                                                                    setState(() {
                                                                      //重新写回本地数据库,并刷新界面
                                                                      ShoppingCartService.addListToCart(shoppingCartProductList);
                                                                      Fluttertoast.showToast(msg: "删除成功");
                                                                      //关闭对话框
                                                                      Navigator.pop(context);
                                                                    });
                                                                  },
                                                                  child: Text(
                                                                    '确定',
                                                                    style: TextStyle(fontSize: ScreenAdaptor.size(30)),
                                                                  )),
                                                            ],
                                                          ));
                                                },
                                              ))),
                                    ],
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black12, width: ScreenAdaptor.width(1)))),
                child: Flex(
                  direction: Axis.horizontal,
                  children: [
                    Expanded(
                        flex: 5,
                        child: Container(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: ScreenAdaptor.height(58),
                                width: ScreenAdaptor.width(58),
                                child: Checkbox(
                                  value: false,
                                  onChanged: (value) {},
                                ),
                              ),
                              Text(
                                "全选",
                                style: TextStyle(fontSize: ScreenAdaptor.size(28), color: Colors.black38),
                              )
                            ],
                          ),
                        )),
                    Expanded(
                        flex: 10,
                        child: Container(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "已选2件,",
                                style: TextStyle(fontSize: ScreenAdaptor.size(25), color: Colors.black38),
                              ),
                              Text(
                                "合计:",
                                style: TextStyle(fontSize: ScreenAdaptor.size(26), color: Colors.black54),
                              ),
                              Text(
                                "¥1192.51",
                                style: TextStyle(fontSize: ScreenAdaptor.size(36), color: MyColors.mainBackgroundColor),
                              ),
                            ],
                          ),
                        )),
                    Expanded(
                        flex: 6,
                        child: Container(
                          alignment: Alignment.center,
                          child: MaterialButton(
                            color: MyColors.mainBackgroundColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(ScreenAdaptor.size(38)),
                            ),
                            child: Text(
                              "结算",
                              style: TextStyle(fontSize: ScreenAdaptor.size(29), color: Colors.white),
                            ),
                            onPressed: () {},
                          ),
                        )),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  void initCartList() async {
    var list = await ShoppingCartService.getShopppingCartList();
    setState(() {
      shoppingCartProductList = list;
    });
    print("初始化购物车数据...");
    print("总数量 : " + shoppingCartProductList.length.toString());
  }
}
