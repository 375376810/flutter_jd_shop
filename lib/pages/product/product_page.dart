import 'package:flutter/material.dart';
import 'package:flutterjdshop/pages/product/product_details_widget.dart';
import 'package:flutterjdshop/pages/product/product_evaluation_widget.dart';
import 'package:flutterjdshop/services/screen_adaptor.dart';

class ProductPage extends StatefulWidget {
  final Map arguments;

  const ProductPage({Key? key, required this.arguments}) : super(key: key);

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
              TabBarView(children: [
                ProductDetailsWidget(),
                ProductEvaluationWidget()
              ]),
              Positioned(bottom: 0, child: Container(width: 500, height: ScreenAdaptor.height(80), color: Colors.blue,))
            ],
          )
        ));
  }
}
