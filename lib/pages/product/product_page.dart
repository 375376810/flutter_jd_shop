import 'package:flutter/material.dart';
import 'package:flutterjdshop/generated/l10n.dart';
import 'package:flutterjdshop/model/shopping_cart_product.dart';
import 'package:flutterjdshop/pages/product/product_details_widget.dart';
import 'package:flutterjdshop/pages/product/product_ratings_widget.dart';
import 'package:flutterjdshop/services/my_image_widget.dart';
import 'package:flutterjdshop/services/screen_adaptor.dart';
import 'package:flutterjdshop/services/shopping_cart_service.dart';
import 'package:flutterjdshop/widgets/my_colors.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../config/basic_config.dart';
import '../../providers/product_provider.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  String selectedSize = "";
  String selectedColor = "";
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    ScreenAdaptor.init(context);
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              foregroundColor: MyColors.mainBackgroundColor,
              title: Container(
                alignment: Alignment.center,
                child: const TabBar(
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: MyColors.mainBackgroundColor,
                  tabs: [
                    Tab(
                      child: Text("详情", style: TextStyle(color: MyColors.mainBackgroundColor)),
                    ),
                    Tab(
                      child: Text("评论", style: TextStyle(color: MyColors.mainBackgroundColor)),
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
                    child: SizedBox(
                      width: ScreenAdaptor.getScreenWidth(),
                      height: ScreenAdaptor.height(108),
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
                                          Fluttertoast.showToast(msg: "客服功能正在完善中...");
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
                                          showBottom(productProvider);
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
                                color: MyColors.mainBackgroundColor,
                                child: InkWell(
                                  onTap: () {
                                    print("立即购买");
                                    //复制加入购物车
                                    showBottom(productProvider);
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

  void showBottom(ProductProvider productProvider) {
    List<ProductSpecs> specsList = [];
    List<ProductColors> colorsList = [];
    initSpecList(specsList);
    initColorsList(colorsList);

    ///每次打开底部弹出框时,都需要重新初始化选中的结果数据
    initResult();
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      isScrollControlled: true,
      builder: (contex) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setBottomState) {
            return Container(
                height: ScreenAdaptor.height(1000),
                padding: EdgeInsets.all(ScreenAdaptor.width(20)),
                child: Column(
                  children: [
                    ///上部
                    SizedBox(
                      height: ScreenAdaptor.height(150),
                      child: Flex(
                        direction: Axis.horizontal,
                        children: [
                          Expanded(
                            flex: 10,
                            child: AspectRatio(
                              aspectRatio: 1,
                              child: MyImageWidget(BasicConfig.basicServerUrl + productProvider.currentProduct!.url!),
                            ),
                          ),
                          Expanded(
                            flex: 30,
                            child: Container(
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.fromLTRB(ScreenAdaptor.width(15), ScreenAdaptor.height(15), 0, 0),
                              child: Text(
                                "￥" + productProvider.currentProduct!.price!.toStringAsFixed(2),
                                style: TextStyle(color: MyColors.mainBackgroundColor, fontSize: ScreenAdaptor.size(32)),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 10,
                            child: Container(
                              alignment: Alignment.topRight,
                              child: SizedBox(
                                width: ScreenAdaptor.width(50),
                                height: ScreenAdaptor.height(50),
                                child: IconButton(
                                  padding: const EdgeInsets.all(0.0),
                                  icon: Icon(
                                    Icons.close,
                                    size: ScreenAdaptor.size(39),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(),

                    ///中部
                    SizedBox(
                      height: ScreenAdaptor.height(600),
                      child: ListView(
                        children: [
                          Container(
                            height: ScreenAdaptor.height(80),
                            child: const Text("尺码"),
                            alignment: Alignment.centerLeft,
                          ),
                          Wrap(
                            direction: Axis.horizontal,
                            spacing: ScreenAdaptor.width(15),
                            children: productSizeWidget(specsList, setBottomState),
                          ),
                          const Divider(),
                          Container(
                            height: ScreenAdaptor.height(80),
                            child: const Text("颜色"),
                            alignment: Alignment.centerLeft,
                          ),
                          Wrap(
                            direction: Axis.horizontal,
                            spacing: ScreenAdaptor.width(10),
                            children: productColorWidget(colorsList, setBottomState),
                          ),
                          const Divider(),
                          Container(
                            height: ScreenAdaptor.height(100),
                            alignment: Alignment.centerLeft,
                            child: Flex(
                              direction: Axis.horizontal,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Row(
                                    children: [
                                      const Text("购买数量"),
                                      SizedBox(
                                        width: ScreenAdaptor.width(15),
                                      ),
                                      Text(
                                        "有货",
                                        style: TextStyle(color: Colors.black38, fontSize: ScreenAdaptor.size(25)),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                    child: Wrap(
                                      direction: Axis.horizontal,
                                      spacing: ScreenAdaptor.size(2),
                                      children: [
                                        InkWell(
                                          child: Container(
                                            height: ScreenAdaptor.height(68),
                                            width: ScreenAdaptor.width(68),
                                            color: Colors.black12,
                                            alignment: Alignment.center,
                                            child: Text(
                                              "-",
                                              style: TextStyle(
                                                fontSize: ScreenAdaptor.size(28),
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          onTap: () {
                                            if (quantity > 0) {
                                              setBottomState(() => quantity--);
                                            }
                                          },
                                        ),
                                        Container(
                                          height: ScreenAdaptor.height(68),
                                          width: ScreenAdaptor.width(68),
                                          color: Colors.black12,
                                          alignment: Alignment.center,
                                          child: Text(
                                            "$quantity",
                                            style: TextStyle(
                                              fontSize: ScreenAdaptor.size(28),
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        InkWell(
                                          child: Container(
                                            height: ScreenAdaptor.height(68),
                                            width: ScreenAdaptor.width(68),
                                            color: Colors.black12,
                                            alignment: Alignment.center,
                                            child: Text(
                                              "+",
                                              style: TextStyle(
                                                fontSize: ScreenAdaptor.size(28),
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          onTap: () {
                                            setBottomState(() => quantity++);
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: ScreenAdaptor.height(60))
                        ],
                      ),
                    ),

                    ///下部
                    Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          child: MaterialButton(
                            color: MyColors.mainBackgroundColor,
                            minWidth: double.infinity,
                            padding: EdgeInsets.all(ScreenAdaptor.height(20)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(ScreenAdaptor.size(36)),
                            ),
                            child: Text(
                              "加入购物车",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenAdaptor.size(30),
                              ),
                            ),
                            onPressed: () {
                              addToCart(productProvider);
                            },
                          ),
                        ))
                  ],
                ));
          },
        );
      },
    );
  }

  ///初始化选中的资源
  void initResult() {
    selectedSize = "";
    selectedColor = "";
    quantity = 0;
  }

  void initSpecList(specsList) {
    specsList.add(ProductSpecs("M", false));
    specsList.add(ProductSpecs("L", false));
    specsList.add(ProductSpecs("XL", false));
    specsList.add(ProductSpecs("XXL", false));
    specsList.add(ProductSpecs("3XL", false));
    specsList.add(ProductSpecs("4XL", false));
    specsList.add(ProductSpecs("5XL", false));
  }

  void initColorsList(colorsList) {
    colorsList.add(ProductColors("红色", false, Colors.red));
    colorsList.add(ProductColors("蓝色", false, Colors.blue));
    colorsList.add(ProductColors("紫色", false, Colors.purple));
    colorsList.add(ProductColors("青色", false, Colors.lightBlue));
    colorsList.add(ProductColors("绿色", false, Colors.green));
    colorsList.add(ProductColors("橙色", false, Colors.orange));
    colorsList.add(ProductColors("黑色", false, Colors.black));
  }

  List<RawChip> productSizeWidget(specsList, setBottomState) {
    List<RawChip> chipList = [];
    for (ProductSpecs specs in specsList) {
      chipList.add(RawChip(
        label: Text(
          specs.size,
          style: TextStyle(
            color: specs.selected ? MyColors.mainBackgroundColor : Colors.black54,
            fontSize: ScreenAdaptor.size(25),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ScreenAdaptor.size(12)),
          side: BorderSide(
            color: specs.selected ? MyColors.mainBackgroundColor : Colors.white,
            width: ScreenAdaptor.size(2),
          ),
        ),
        labelPadding: EdgeInsets.symmetric(horizontal: ScreenAdaptor.width(20)),
        onPressed: () {
          for (var v in specsList) {
            v.selected = false;
          }
          setBottomState(() {
            specs.selected = true;
            selectedSize = specs.size;
          });
        },
      ));
    }
    return chipList;
  }

  List<RawChip> productColorWidget(colorsList, setBottomState) {
    List<RawChip> chipList = [];
    for (ProductColors productColors in colorsList) {
      chipList.add(RawChip(
        label: Text(
          productColors.describe,
          style: TextStyle(
            color: productColors.selected ? MyColors.mainBackgroundColor : Colors.black54,
            fontSize: ScreenAdaptor.size(25),
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ScreenAdaptor.size(12)),
          side: BorderSide(
            color: productColors.selected ? MyColors.mainBackgroundColor : Colors.white,
            width: ScreenAdaptor.size(2),
          ),
        ),
        labelPadding: EdgeInsets.symmetric(horizontal: ScreenAdaptor.width(20)),
        onPressed: () {
          for (var v in colorsList) {
            v.selected = false;
          }
          setBottomState(() {
            productColors.selected = true;
            selectedColor = productColors.describe;
          });
        },
        avatar: CircleAvatar(
          radius: ScreenAdaptor.size(18),
          backgroundColor: productColors.color,
        ),
      ));
    }
    return chipList;
  }

  void addToCart(ProductProvider productProvider) async {
    print("result : selectedSize " + selectedSize + " selectedColor" + selectedColor + " quantity" + quantity.toString());
    //非空判断
    if (selectedSize.isEmpty) {
      Fluttertoast.showToast(msg: "请选择尺码...");
      return;
    }
    if (selectedColor.isEmpty) {
      Fluttertoast.showToast(msg: "请选择颜色...");
      return;
    }
    if (quantity <= 0) {
      Fluttertoast.showToast(msg: "请选择购买数量...");
      return;
    }
    //生成一个购物车item
    //this.title, this.desc, this.url, this.price,
    ShoppingCartProduct shoppingCartProduct = ShoppingCartProduct(
        productProvider.currentProduct!.title, productProvider.currentProduct!.desc, productProvider.currentProduct!.url, productProvider.currentProduct!.price, selectedSize, selectedColor, quantity);
    //将购买的信息加入购物车本地存储配置文件
    bool success = await ShoppingCartService.addToCart(shoppingCartProduct);
    if (success) {
      Fluttertoast.showToast(
        //加入购物车成功
        msg: S.current.product_page_jiarugouwuchechenggong,
        backgroundColor: Colors.black38,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
      );
      //关闭底部框
      Navigator.pop(context);
    } else {
      Fluttertoast.showToast(
        //出现错误,请重试
        msg: S.current.product_page_chuxiancuowuqingchongshi,
        backgroundColor: Colors.black38,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
      );
    }
  }
}

class ProductSpecs {
  String size = "";
  bool selected = false;

  ProductSpecs(this.size, this.selected);
}

class ProductColors {
  String describe = "";
  bool selected = false;
  Color color = Colors.white;

  ProductColors(this.describe, this.selected, this.color);
}
