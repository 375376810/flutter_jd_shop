import 'package:flutter/material.dart';
import 'package:flutterjdshop/services/MyImageWidget.dart';
import 'package:flutterjdshop/services/ScreenAdaptor.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CategoryPageState();
  }
}

class CategoryPageState extends State {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    ScreenAdaptor.init(context);
    return Row(
      children: [
        //左侧
        SizedBox(
          width: ScreenAdaptor.getScreenWidth() / 4,
          height: double.infinity,
          child: ListView.builder(
              itemCount: 28,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    InkWell(
                      child: Container(
                          width: double.infinity,
                          height: ScreenAdaptor.setHeight(56),
                          alignment: Alignment.center,
                          color: selectedIndex == index ? Colors.red : Colors.white,
                          child: Text("第${index}条", textAlign: TextAlign.center)),
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                    ),
                    Divider(
                      height: ScreenAdaptor.setHeight(1),
                    )
                  ],
                );
              }),
        ),
        //右侧
        Expanded(
            flex: 1,
            child: Container(
              color: const Color.fromRGBO(240, 246, 246, 0.9),
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(childAspectRatio: 1 / 1.3, crossAxisCount: 3),
                  itemCount: 18,
                  itemBuilder: (context, index) {
                    return Container(
                        margin: const EdgeInsets.all(5),
                        child: Column(children: [
                          AspectRatio(aspectRatio: 1 / 1, child: MyImageWidget("http://192.168.1.104:8080/spring_boot_jd_shop/images/flutter/hot2.jpg")),
                          Container(
                            alignment: Alignment.center,
                            height: ScreenAdaptor.setHeight(58),
                            child: const Text("潮流女装"),
                          )
                        ]));
                  }),
            ))
      ],
    );
  }
}
