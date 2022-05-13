import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../config/basic_config.dart';
import '../../config/server_interface.dart';
import '../../model/category_items_info.dart';
import '../../model/category_list_info.dart';
import '../../services/my_image_widget.dart';
import '../../services/screen_adaptor.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CategoryPageState();
  }
}

class CategoryPageState extends State with AutomaticKeepAliveClientMixin{
  int selectedIndex = 0;
  List<CategoryList> leftList = [];
  List<CategoryItems> rightList = [];

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    getLeftListData();
  }

  getLeftListData() async {
    //初始化左右区域2个列表数据
    var response = await Dio().get(BasicConfig.basicServerUrl + ServiceInterface.categoryListInfo);
    CategoryListInfo info = CategoryListInfo.fromJson(response.data);
    setState(() {
      leftList = info.categoryList!;
    });
    //默认第一条选中
    if (leftList.isNotEmpty) {
      getRightItemsData(leftList[0].id);
    }
  }

  ///获取右侧数据
  getRightItemsData(int? categoryListId) async {
    var response = await Dio().get(BasicConfig.basicServerUrl + ServiceInterface.categoryItemsInfo + "?category_list_id=${categoryListId}");
    CategoryItemsInfo info = CategoryItemsInfo.fromJson(response.data);
    setState(() {
      rightList = info.categoryItems!;
    });
  }

  Widget leftWidget() {
    if (leftList.isNotEmpty) {
      return ListView.builder(
          itemCount: leftList.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                InkWell(
                  child: Container(
                      width: double.infinity,
                      height: ScreenAdaptor.height(128),
                      alignment: Alignment.center,
                      color: selectedIndex == index ? Colors.white : Colors.lightBlue[50] ,
                      child: Text(
                        leftList[index].title!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),
                      )),
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                      getRightItemsData(leftList[index].id);
                    });
                  },
                ),
                Divider(
                  height: ScreenAdaptor.height(1),
                )
              ],
            );
          });
    } else {
      return const Center(
        child: Text(""),
      );
    }
  }

  Widget rightWidget() {
    if (rightList.isNotEmpty) {
      return Container(
        color: Colors.white,
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio: 1 / 1.5, crossAxisCount: 3),
            itemCount: rightList.length,
            itemBuilder: (context, index) {
              return Container(
                  margin: const EdgeInsets.all(3),
                  child: Column(children: [
                    AspectRatio(aspectRatio: 1 / 1, child: MyImageWidget(BasicConfig.basicServerUrl + rightList[index].url!)),
                    Container(
                        margin: const EdgeInsets.all(1),
                        height: ScreenAdaptor.height(60),
                        child: Text(
                          rightList[index].desc!,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 11,
                          ),
                        )),
                    Container(
                        margin: const EdgeInsets.all(1),
                        height: ScreenAdaptor.height(32),
                        child: Row(
                          children: [
                            const Text("￥:",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 12,
                                )),
                            Text(
                              rightList[index].price!.toStringAsFixed(2),
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                color: Colors.black54,
                                fontSize: 12,
                              ),
                            )
                          ],
                        ))
                  ]));
            }),
      );
    } else {
      return const Center(
        child: Text(""),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenAdaptor.init(context);
    return Flex(
      direction: Axis.horizontal,
      children: [
        //左侧
        Expanded(flex: 2, child: leftWidget()),
        //右侧
        Expanded(flex: 8, child: rightWidget())
      ],
    );
  }


}
