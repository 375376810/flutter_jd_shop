import 'package:flutter/material.dart';
import 'package:flutterjdshop/model/user.dart';
import 'package:flutterjdshop/services/screen_adaptor.dart';
import 'package:flutterjdshop/services/user_service.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return UserPageState();
  }
}

class UserPageState extends State {
  User user = User(id: 1, userName: "", password: "", nickName: "", address: "", salt: "", gender: 1, age: 2, email: "");

  @override
  void initState() {
    super.initState();
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
    print("用户..........${user.nickName}");
  }

  @override
  Widget build(BuildContext context) {
    ScreenAdaptor.init(context);
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            //背景
            Container(color: const Color.fromRGBO(5, 0, 31, 1)),
            Flex(
              direction: Axis.vertical,
              children: [
                Expanded(
                  flex: 165,
                  child: Container(
                    alignment: Alignment.center,
                    child: Transform.scale(
                      scale: 0.8,
                      child: Container(
                        width: ScreenAdaptor.width(530),
                        height: ScreenAdaptor.width(530),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(color: const Color.fromRGBO(13, 7, 41, 1), borderRadius: BorderRadius.circular(ScreenAdaptor.size(500))),
                        child: Container(
                          width: ScreenAdaptor.width(430),
                          height: ScreenAdaptor.width(430),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(color: const Color.fromRGBO(27, 21, 55, 1), borderRadius: BorderRadius.circular(ScreenAdaptor.size(500))),
                          child: Container(
                            width: ScreenAdaptor.width(380),
                            height: ScreenAdaptor.width(380),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(color: const Color.fromRGBO(45, 40, 76, 1), borderRadius: BorderRadius.circular(ScreenAdaptor.size(500))),
                            child: Container(
                              width: ScreenAdaptor.width(330),
                              height: ScreenAdaptor.width(330),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(color: const Color.fromRGBO(62, 56, 92, 1), borderRadius: BorderRadius.circular(ScreenAdaptor.size(500))),
                              child: Container(
                                width: ScreenAdaptor.width(280),
                                height: ScreenAdaptor.width(280),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(ScreenAdaptor.size(500))),
                                child: ClipOval(child: user.userName == "" ? Container() : Image.asset('images/portrait.jpg', width: double.infinity, height: double.infinity, fit: BoxFit.cover)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(flex: 100, child: Container()),
              ],
            ),
            //布局
            Flex(
              direction: Axis.vertical,
              children: [
                Expanded(flex: 1, child: Container()),
                Expanded(
                    flex: 3,
                    child: Container(
                      alignment: Alignment.center,
                      child: Flex(
                        direction: Axis.horizontal,
                        children: [
                          Expanded(flex: 1, child: Container()),
                          Expanded(
                              flex: 6,
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "个人中心",
                                  style: TextStyle(fontSize: ScreenAdaptor.size(45), color: Colors.white, fontWeight: FontWeight.bold),
                                ),
                              )),
                          Expanded(
                              flex: 1,
                              child: Container(
                                alignment: Alignment.center,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.settings,
                                    color: Colors.white,
                                    size: ScreenAdaptor.size(45),
                                  ),
                                  onPressed: () {},
                                ),
                              )),
                        ],
                      ),
                    )),
                Expanded(flex: 8, child: Container()),
                Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      child: user.userName == ""
                          ? InkWell(
                              onTap: () {
                                setState(() {
                                  Navigator.pushNamed(context, "/login").then((value) {
                                    setState(() {
                                      initUser();
                                    });
                                  });
                                });
                              },
                              child: Text(
                                "登录",
                                style: TextStyle(color: Colors.white, fontSize: ScreenAdaptor.size(38)),
                              ),
                            )
                          : Text(
                              "${user.nickName!}(${user.userName})",
                              style: TextStyle(color: Colors.white, fontSize: ScreenAdaptor.size(32)),
                            ),
                    )),
                Expanded(
                  flex: 12,
                  child: user.userName == ""
                      ? Container()
                      : Container(
                          width: double.infinity,
                          height: ScreenAdaptor.height(158),
                          margin: EdgeInsets.all(ScreenAdaptor.size(15)),
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
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text("我的积分", style: TextStyle(fontSize: ScreenAdaptor.size(32))),
                                  leading: Icon(
                                    Icons.card_giftcard,
                                    size: ScreenAdaptor.size(50),
                                  ),
                                  trailing: Text("3529", style: TextStyle(fontSize: ScreenAdaptor.size(32))),
                                ),
                                Divider(
                                  color: Colors.black38,
                                  thickness: ScreenAdaptor.size(1),
                                ),
                                ListTile(
                                  title: Text("我的订单", style: TextStyle(fontSize: ScreenAdaptor.size(32))),
                                  leading: Icon(
                                    Icons.library_books,
                                    size: ScreenAdaptor.size(50),
                                  ),
                                  trailing: Icon(
                                    Icons.arrow_forward_ios,
                                    size: ScreenAdaptor.size(50),
                                  ),
                                  onTap: () {
                                    Fluttertoast.showToast(msg: "我的订单");
                                  },
                                ),
                                Divider(
                                  color: Colors.black38,
                                  thickness: ScreenAdaptor.size(1),
                                ),
                                ListTile(
                                  title: Text("退出登录", style: TextStyle(fontSize: ScreenAdaptor.size(32))),
                                  leading: Icon(Icons.power_settings_new, size: ScreenAdaptor.size(50)),
                                  onTap: () async {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) => AlertDialog(
                                        title: Text(
                                          '退出',
                                          style: TextStyle(fontSize: ScreenAdaptor.size(36)),
                                        ),
                                        content: Text(
                                          "确认要退出登录吗?",
                                          style: TextStyle(fontSize: ScreenAdaptor.size(30)),
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
                                                setState(() {
                                                  //删除本地用户数据
                                                  UserService.deleteUserData();
                                                  user = User(id: 1, userName: "", password: "", nickName: "", address: "", salt: "", gender: 1, age: 2, email: "");
                                                  Fluttertoast.showToast(msg: "已退出");
                                                  //关闭对话框
                                                  Navigator.pop(context);
                                                });
                                              },
                                              child: Text(
                                                '确定',
                                                style: TextStyle(fontSize: ScreenAdaptor.size(30)),
                                              )),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                                Divider(
                                  color: Colors.black38,
                                  thickness: ScreenAdaptor.size(1),
                                ),
                              ],
                            ),
                          ),
                        ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
