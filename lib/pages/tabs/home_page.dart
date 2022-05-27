import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:flutterjdshop/model/guess_you_like_items_info.dart';
import 'package:flutterjdshop/model/hot_product_items_info.dart';
import 'package:flutterjdshop/model/product.dart';
import 'package:flutterjdshop/widgets/my_colors.dart';

import '../../config/basic_config.dart';
import '../../config/server_interface.dart';
import '../../model/hot_product_items_count_info.dart';
import '../../model/swiper_info.dart';
import '../../routers/router.dart';
import '../../services/my_image_widget.dart';
import '../../services/screen_adaptor.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State with AutomaticKeepAliveClientMixin {
  List<SwiperItems> swiperItemList = [];
  int hotProductItemsCount = 0;
  List<HotProductItemsByPage> hotProductItemsByPage = [];
  List<GuessYouLikeItems> guessYouLikeItemList = [];

  //分页从第0页开始
  int pageNumber = 0;
  int pageSize = 6;
  ScrollController scrollController = ScrollController();
  bool flag = true;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    getSwiperInfo();
    getGuessYouLikeItems();
    getHotProductItemsCount();
    getHotProductItemsByPage();
    //监听滚动条滚动事件
    scrollController.addListener(() {
      //如果当前页小于总页数,说明还有数据
      if (flag && scrollController.position.pixels >= scrollController.position.maxScrollExtent - 20 && pageNumber < hotProductItemsCount / pageSize) {
        setState(() {
          pageNumber++;
          getHotProductItemsByPage();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //初始化屏幕适配750*1344
    ScreenAdaptor.init(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.center_focus_weak, size: ScreenAdaptor.width(50), color: Colors.white), onPressed: null),
        title: InkWell(
            child: Container(
              height: ScreenAdaptor.height(86),
              decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(25)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [SizedBox(width: ScreenAdaptor.width(21)), const Icon(Icons.search), SizedBox(width: ScreenAdaptor.width(6)), Text("热搜", style: TextStyle(fontSize: ScreenAdaptor.size(30)))],
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, "/search");
            }),
        actions: [IconButton(onPressed: null, icon: Icon(Icons.apps, size: ScreenAdaptor.width(50), color: Colors.white))],
      ),
      body: ListView(controller: scrollController, children: <Widget>[
        swiperWidget(),
        SizedBox(height: ScreenAdaptor.height(10)),
        titleWidget("猜你喜欢"),
        guessYouLikeWidget(),
        SizedBox(height: ScreenAdaptor.height(10)),
        titleWidget("热门推荐"),
        hotProductWidget(),
        hasMoreWidget()
      ]),
    );
  }

  Widget hasMoreWidget() {
    return Container(
        width: double.infinity,
        height: ScreenAdaptor.height(60),
        alignment: Alignment.center,
        margin: EdgeInsets.all(ScreenAdaptor.width(10)),
        child: pageNumber < hotProductItemsCount / pageSize
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(
                    width: 15,
                    height: 15,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                  SizedBox(width: 10),
                  Text("加载更多...")
                ],
              )
            : InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.arrow_upward,
                      color: MyColors.mainBackgroundColor,
                    ),
                    Text(
                      "回到顶部",
                      style: TextStyle(color: MyColors.mainBackgroundColor, fontSize: ScreenAdaptor.size(26)),
                    )
                  ],
                ),
                onTap: () {
                  scrollController.jumpTo(0);
                },
              ));
  }

  getGuessYouLikeItems() async {
    String path = BasicConfig.basicServerUrl + ServiceInterface.guessYouLikeItemsInfo;
    var response = await Dio().get(path);
    var info = GuessYouLikeItemsInfo.fromJson(response.data);
    setState(() {
      guessYouLikeItemList = info.guessYouLikeItems!;
    });
  }

  getHotProductItemsCount() async {
    String path = BasicConfig.basicServerUrl + ServiceInterface.getHotProductItemsCount;
    var response = await Dio().get(path);
    var info = HotProductItemsCountInfo.fromJson(response.data);
    setState(() {
      hotProductItemsCount = info.hotProductItemsCount!;
    });
  }

  getHotProductItemsByPage() async {
    setState(() {
      flag = false;
    });
    String path = BasicConfig.basicServerUrl + ServiceInterface.getHotProductItemsByPage;
    var response = await Dio().get(path, queryParameters: {"page_number": pageNumber, "page_size": pageSize});
    var info = HotProductItemsInfo.fromJson(response.data);
    setState(() {
      hotProductItemsByPage.addAll(info.hotProductItemsByPage!);
      flag = true;
    });
  }

  getSwiperInfo() async {
    //请求服务器轮播图数据
    String path = BasicConfig.basicServerUrl + ServiceInterface.swiperInfo;
    var response = await Dio().get(path);
    var items = SwiperInfo.fromJson(response.data);
    setState(() {
      swiperItemList = items.swiperItems!;
    });
  }

  ///轮播图
  Widget swiperWidget() {
    if (swiperItemList.isNotEmpty) {
      return AspectRatio(
        aspectRatio: 2 / 1,
        child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              return MyImageWidget(BasicConfig.basicServerUrl + swiperItemList[index].url!);
            },
            pagination: const SwiperPagination(),
            autoplay: true,
            itemCount: swiperItemList.length),
      );
    } else {
      return Container(
        height: ScreenAdaptor.height(300),
        alignment: Alignment.center,
        child: const Text(""),
      );
    }
  }

  ///标题组件
  Widget titleWidget(String title) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(left: ScreenAdaptor.width(10)),
      padding: EdgeInsets.only(left: ScreenAdaptor.width(10)),
      height: ScreenAdaptor.height(32),
      decoration: BoxDecoration(border: Border(left: BorderSide(color: Colors.blue.shade800, width: ScreenAdaptor.width(10)))),
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
        margin: EdgeInsets.all(ScreenAdaptor.width(5)),
        height: ScreenAdaptor.height(255),
        child: ListView.builder(
            itemCount: guessYouLikeItemList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Product guessYouLikeProduct = Product(guessYouLikeItemList[index].title, guessYouLikeItemList[index].desc, guessYouLikeItemList[index].url, guessYouLikeItemList[index].price);
                  goToDetaislPage(context, guessYouLikeProduct);
                },
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(ScreenAdaptor.width(5)),
                      width: ScreenAdaptor.width(200),
                      height: ScreenAdaptor.height(200),
                      child: MyImageWidget(BasicConfig.basicServerUrl + guessYouLikeItemList[index].url!),
                    ),
                    Container(
                      margin: EdgeInsets.all(ScreenAdaptor.width(5)),
                      width: ScreenAdaptor.width(200),
                      height: ScreenAdaptor.height(30),
                      child: Text(guessYouLikeItemList[index].title!, style: TextStyle(fontSize: ScreenAdaptor.width(23)), maxLines: 1, overflow: TextOverflow.ellipsis),
                    )
                  ],
                ),
              );
            }));
  }

  ///热门推荐商品组件
  Widget hotProductWidget() {
    var screenWith = ScreenAdaptor.getScreenWidth();
    List<Widget> hotList = [];
    for (int index = 0; index < hotProductItemsByPage.length; index++) {
      Widget w = Container(
          width: (screenWith / 2),
          padding: const EdgeInsets.all(10),
          //height: 380,
          decoration: BoxDecoration(border: Border.all(width: ScreenAdaptor.width(1), color: const Color.fromRGBO(233, 233, 233, 0.9))),
          child: InkWell(
            onTap: () {
              Product hotProduct = Product(hotProductItemsByPage[index].title!, hotProductItemsByPage[index].desc!, hotProductItemsByPage[index].url!, hotProductItemsByPage[index].price!);
              goToDetaislPage(context, hotProduct);
            },
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 1 / 1,
                  child: MyImageWidget(BasicConfig.basicServerUrl + hotProductItemsByPage[index].url!),
                ),
                Container(
                    margin: EdgeInsets.all(ScreenAdaptor.width(8)),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "${hotProductItemsByPage[index].title}",
                      style: const TextStyle(color: Colors.black38),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    )),
                Stack(
                  children: [
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "¥${hotProductItemsByPage[index].price!.toStringAsFixed(2)}",
                          style: const TextStyle(color: MyColors.mainBackgroundColor, fontSize: 15),
                        )),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text("￥${(hotProductItemsByPage[index].price! / 0.8).toStringAsFixed(2)}",
                          style: const TextStyle(color: Colors.black45, fontSize: 13, decoration: TextDecoration.lineThrough)),
                    )
                  ],
                )
              ],
            ),
          ));
      hotList.add(w);
    }
    return Wrap(
      children: hotList,
    );
  }
}
