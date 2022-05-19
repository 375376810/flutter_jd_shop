import 'package:flutter/material.dart';
import 'package:flutterjdshop/pages/product/product_details_widget.dart';
import 'package:flutterjdshop/pages/product/product_ratings_widget.dart';
import 'package:flutterjdshop/services/screen_adaptor.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    ScreenAdaptor.init(context);
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              title: Container(
                alignment: Alignment.center,
                child: const TabBar(
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: [
                    Tab(
                      child: Text("详情"),
                    ),
                    Tab(
                      child: Text("评论 "),
                    ),
                  ],
                ),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      showMenu(context: context, position: RelativeRect.fromLTRB(ScreenAdaptor.width(300), ScreenAdaptor.height(180), ScreenAdaptor.width(0), ScreenAdaptor.height(300)), items: [
                        PopupMenuItem(
                            child: Row(
                              children: const [Icon(Icons.home), Text("主页")],
                            ),
                            onTap: () {
                              Navigator.pop(context);
                            }),
                        PopupMenuItem(
                          child: Row(
                            children: const [Icon(Icons.search), Text("搜索")],
                          ),
                        )
                      ]);
                    },
                    icon: const Icon(Icons.more_horiz))
              ],
            ),
            body: Stack(
              children: [
                const TabBarView(children: [ProductDetailsWidget(), ProductRatingsWidget()]),
                Positioned(
                    bottom: 0,
                    child: Container(
                      width: ScreenAdaptor.getScreenWidth(),
                      height: ScreenAdaptor.height(118),
                      child: Material(
                        color: Colors.teal,
                        child: Flex(
                          direction: Axis.horizontal,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Flex(
                                direction: Axis.horizontal,
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child: InkWell(
                                        onTap: () {
                                          print("联系客服...");
                                        },
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.announcement,
                                              color: Colors.white,
                                            ),
                                            SizedBox(
                                              height: ScreenAdaptor.height(8),
                                            ),
                                            Text(
                                              "联系客服",
                                              style: TextStyle(color: Colors.white, fontSize: ScreenAdaptor.size(22)),
                                            )
                                          ],
                                        ),
                                      )),
                                  SizedBox(
                                    height: ScreenAdaptor.height(68),
                                    child: const VerticalDivider(width: 1, color: Colors.black38, thickness: 1),
                                  ),
                                  Expanded(
                                      flex: 1,
                                      child: InkWell(
                                        onTap: () {
                                          print("加入购物车");
                                        },
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.shopping_cart,
                                              color: Colors.white,
                                            ),
                                            SizedBox(
                                              height: ScreenAdaptor.height(8),
                                            ),
                                            Text(
                                              "加入购物车",
                                              style: TextStyle(color: Colors.white, fontSize: ScreenAdaptor.size(22)),
                                            )
                                          ],
                                        ),
                                      ))
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Ink(
                                color: const Color.fromRGBO(102, 103, 171, 1),
                                child: InkWell(
                                  onTap: () {
                                    print("立即购买");
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text("立即购买", style: TextStyle(color: Colors.white, fontSize: ScreenAdaptor.size(30))),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ))
              ],
            )));
  }
}
