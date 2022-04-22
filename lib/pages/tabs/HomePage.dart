import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:flutterjdshop/BasicConfig.dart';
import 'package:flutterjdshop/ServiceInterface.dart';
import 'package:flutterjdshop/services/ScreenAdaptor.dart';

import '../../model/SwiperInfo.dart';
import '../../services/MyImageWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }

}

class HomePageState extends State {

  List<SwiperItems> itemList = [];

  @override
  Future<void> initState() async {
    super.initState();
    //请求服务器轮播图数据
    String path = BasicConfig.basicServerUrl+ServiceInterface.swiperInfo;
    var result = await Dio().get(path);
    var items = SwiperInfo.fromJson(result.data);
    setState(() {
      itemList = items.resultList;
    });
  }

  ///轮播图
  //TODO:后期会使用服务器返回的json数据解析获得轮播图资源
  Widget swiperWidget() {
    /*List<Map> imageList = [
      {"url": BasicConfig.basicServerUrl + "images/flutter/slide01.jpg"},
      {"url": BasicConfig.basicServerUrl + "images/flutter/slide02.jpg"},
      {"url": BasicConfig.basicServerUrl + "images/flutter/slide03.jpg"}
    ];*/

    return AspectRatio(
      aspectRatio: 2 / 1,
      child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return MyImageWidget(itemList[index].url);
          },
          pagination: const SwiperPagination(),
          autoplay: true,
          itemCount: itemList.length),
    );
  }

  ///标题组件
  Widget titleWidget(String title) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(left: ScreenAdaptor.setWidth(10)),
      padding: EdgeInsets.only(left: ScreenAdaptor.setWidth(10)),
      height: ScreenAdaptor.setHeight(32),
      decoration: BoxDecoration(border: Border(left: BorderSide(color: Colors.red, width: ScreenAdaptor.setWidth(10)))),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.black38),
      ),
    );
  }

  ///猜你喜欢商品组件
  Widget guessYouLikeWidget() {
    return Container(
      margin: EdgeInsets.all(ScreenAdaptor.setWidth(5)),
      height: ScreenAdaptor.setHeight(255),
      child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                Container(
                  margin: EdgeInsets.all(ScreenAdaptor.setWidth(5)),
                  width: ScreenAdaptor.setWidth(200),
                  height: ScreenAdaptor.setHeight(200),
                  child: MyImageWidget(BasicConfig.basicServerUrl + "images/flutter/hot${index + 1}.jpg"),
                ),
                Container(
                  margin: EdgeInsets.all(ScreenAdaptor.setWidth(5)),
                  height: ScreenAdaptor.setHeight(30),
                  child: Text(
                    "第${index + 1}个商品",
                    style: TextStyle(fontSize: ScreenAdaptor.setWidth(23)),
                  ),
                )
              ],
            );
          }),
    );
  }

  ///热门推荐商品组件
  Widget hotRecommendWidget() {
    var random = Random(1000);
    var screenWith = ScreenAdaptor.getScreenWidth();
    List<Widget> hotList = [];
    for (int index = 1; index <= 17; index++) {
      double price = random.nextDouble() * 1000;
      Widget w = Container(
          width: (screenWith / 2),
          padding: const EdgeInsets.all(10),
          //height: 380,
          decoration: BoxDecoration(border: Border.all(width: ScreenAdaptor.setWidth(1), color: const Color.fromRGBO(233, 233, 233, 0.9))),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 1 / 1,
                child: MyImageWidget(BasicConfig.basicServerUrl + "images/flutter/list${index}.jpg"),
              ),
              Container(
                  margin: EdgeInsets.all(ScreenAdaptor.setWidth(8)),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "热门商品${index}",
                    style: const TextStyle(color: Colors.black38),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  )),
              Stack(
                children: [
                  Align(alignment: Alignment.centerLeft, child: Text("￥${price.toStringAsFixed(2)}", style: const TextStyle(color: Colors.red, fontSize: 15))),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text("￥${(price * 0.8).toStringAsFixed(2)}", style: const TextStyle(color: Colors.black45, fontSize: 13, decoration: TextDecoration.lineThrough)),
                  )
                ],
              )
            ],
          ));
      hotList.add(w);
    }
    return Wrap(children: hotList);
  }

  @override
  Widget build(BuildContext context) {
    //初始化屏幕适配750*1344
    ScreenAdaptor.init(context);
    return ListView(
      children: <Widget>[
        swiperWidget(),
        SizedBox(height: ScreenAdaptor.setHeight(10)),
        titleWidget("猜你喜欢"),
        guessYouLikeWidget(),
        SizedBox(height: ScreenAdaptor.setHeight(10)),
        titleWidget("热门推荐"),
        hotRecommendWidget()
      ],
    );
  }


}
