import 'package:flutter/material.dart';
import 'package:flutterjdshop/model/user.dart';
import 'package:flutterjdshop/services/screen_adaptor.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../config/basic_config.dart';
import '../model/shopping_cart_product.dart';
import '../services/my_image_widget.dart';
import '../services/user_service.dart';
import '../widgets/my_colors.dart';

class OrderListPage extends StatefulWidget {
  final Map arguments;

  const OrderListPage({Key? key, required this.arguments}) : super(key: key);

  @override
  _OrderListPageState createState() => _OrderListPageState();
}

class _OrderListPageState extends State<OrderListPage> {
  List<ShoppingCartProduct> orderList = [];
  double totalPrice = 0;
  User user = User(id: 1, userName: "", password: "", nickName: "", address: "", salt: "", gender: 1, age: 2, email: "");

  @override
  void initState() {
    super.initState();
    initOrderList();
    initUser();
  }

  void initUser() async {
    //从本地读取用户信息
    var u = await UserService.getUserFromLocal();
    if (u != null) {
      setState(() {
        user = u;
      });
    }
  }

  void initOrderList() {
    List<ShoppingCartProduct> shoppingCartProductList = widget.arguments["shoppingCartProductList"];
    for (ShoppingCartProduct element in shoppingCartProductList) {
      if (element.selected!) {
        orderList.add(element);
        totalPrice += element.price! * element.quantity!;
      }
    }
  }

  List<Widget> orderListWidget() {
    List<Widget> list = [];
    list.add(addressWidget());
    for (int index = 0; index < orderList.length; index++) {
      Widget w = SizedBox(
        height: ScreenAdaptor.height(230),
        child: Container(
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
                flex: 6,
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
                      child: MyImageWidget(BasicConfig.basicServerUrl + orderList[index].url!),
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
                              orderList[index].desc!,
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
                              orderList[index].size! + "   " + orderList[index].color!,
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
                                      "  ¥" + orderList[index].price!.toStringAsFixed(2),
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
                                        "×${orderList[index].quantity}",
                                        style: TextStyle(
                                          color: Colors.black87,
                                          fontSize: ScreenAdaptor.size(28),
                                        ),
                                      ),
                                    ),
                                  )),
                            ],
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
      list.add(w);
    }
    return list;
  }

  Widget addressWidget() {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/edit_address').then((value) {
          setState(() {
            initUser();
          });
        });
      },
      child: Container(
        height: ScreenAdaptor.height(200),
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
        child: user.address == null || user.address2 == null
            ? Container(
                alignment: Alignment.center,
                child: Wrap(
                  children: [
                    Icon(
                      Icons.add_location,
                      color: MyColors.mainBackgroundColor,
                      size: ScreenAdaptor.size(50),
                    ),
                    Text("添加收获地址", style: TextStyle(fontSize: ScreenAdaptor.size(38), color: Colors.black45)),
                  ],
                ),
        )
            : Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.location_on,
                    color: MyColors.mainBackgroundColor,
                    size: ScreenAdaptor.size(80),
                  ),
                )),
            Expanded(
                flex: 4,
                child: Flex(
                  direction: Axis.vertical,
                  children: [
                    Expanded(
                        flex: 2,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            user.address == null || user.address2 == null ? "" : user.address! + user.address2!,
                            style: TextStyle(color: Colors.black87, fontSize: ScreenAdaptor.size(30)),
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Row(
                            children: [
                              Text(
                                user.nickName!,
                                style: TextStyle(fontSize: ScreenAdaptor.size(28), color: Colors.black38),
                              ),
                              SizedBox(
                                width: ScreenAdaptor.width(10),
                              ),
                              Text(
                                user.userName!,
                                style: TextStyle(fontSize: ScreenAdaptor.size(28), color: Colors.black38),
                              ),
                            ],
                          ),
                        )),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ScreenAdaptor.init(context);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: MyColors.mainBackgroundColor,
          title: Center(
            child: Text("确认订单", style: TextStyle(fontSize: ScreenAdaptor.size(38), color: MyColors.mainBackgroundColor)),
          ),
          actions: [Container(width: 50)],
        ),
        body: ListView(
          children: orderListWidget(),
        ),
        bottomNavigationBar: BottomAppBar(
          child: SizedBox(
            height: ScreenAdaptor.height(128),
            child: Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(
                    flex: 2,
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "共${orderList.length}件",
                            style: TextStyle(fontSize: ScreenAdaptor.size(28), color: Colors.black38),
                          ),
                          SizedBox(
                            width: ScreenAdaptor.width(10),
                          ),
                          Text(
                            "合计:",
                            style: TextStyle(fontSize: ScreenAdaptor.size(30), color: Colors.black87),
                          ),
                          SizedBox(
                            width: ScreenAdaptor.width(10),
                          ),
                          Text(
                            "¥${totalPrice.toStringAsFixed(2)}",
                            style: TextStyle(fontSize: ScreenAdaptor.size(36), color: MyColors.mainBackgroundColor),
                          ),
                          SizedBox(
                            width: ScreenAdaptor.width(10),
                          ),
                        ],
                      ),
                    )),
                Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      child: MaterialButton(
                        color: MyColors.mainBackgroundColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(ScreenAdaptor.size(38)),
                        ),
                        child: Text(
                          "提交订单",
                          style: TextStyle(fontSize: ScreenAdaptor.size(29), color: Colors.white),
                        ),
                        onPressed: () {
                          if (user.address == null || user.address2 == null) {
                            Fluttertoast.showToast(
                              msg: "请添加收货地址",
                              backgroundColor: Colors.redAccent,
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.CENTER,
                            );
                            return;
                          }
                          //如果已经添加了收货地址,则跳转到结账页面,并向服务器提交订单
                        },
                      ),
                    )),
              ],
            ),
          ),
        ));
  }
}