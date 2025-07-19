import 'package:city_pickers/city_pickers.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutterjdshop/config/basic_config.dart';
import 'package:flutterjdshop/config/server_interface.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../model/user.dart';
import '../services/screen_adaptor.dart';
import '../services/sign_service.dart';
import '../services/user_service.dart';
import '../widgets/my_colors.dart';

class EditAddressPage extends StatefulWidget {
  const EditAddressPage({Key? key}) : super(key: key);

  @override
  _EditAddressPageState createState() => _EditAddressPageState();
}

class _EditAddressPageState extends State<EditAddressPage> {
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
  }

  @override
  Widget build(BuildContext context) {
    ScreenAdaptor.init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: MyColors.mainBackgroundColor,
        title: Center(
          child: Text("修改收货地址", style: TextStyle(fontSize: ScreenAdaptor.size(38), color: MyColors.mainBackgroundColor)),
        ),
        actions: [Container(width: 50)],
      ),
      body: Container(
        margin: EdgeInsets.all(ScreenAdaptor.size(15)),
        child: ListView(
          children: [
            SizedBox(
              height: ScreenAdaptor.height(130),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: ScreenAdaptor.height(108),
                            margin: EdgeInsets.all(ScreenAdaptor.size(5)),
                            child: Text(
                              "联系人 : ",
                              style: TextStyle(color: MyColors.mainBackgroundColor, fontSize: ScreenAdaptor.size(32)),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(ScreenAdaptor.size(5)),
                            alignment: Alignment.center,
                            color: Colors.white,
                            height: ScreenAdaptor.height(100),
                            width: ScreenAdaptor.width(300),
                            child: TextField(
                              enabled: false,
                              onChanged: (value) {},
                              style: TextStyle(fontSize: ScreenAdaptor.size(28)),
                              maxLines: 1,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: '${user.nickName}',
                                hintStyle: TextStyle(color: Colors.grey, fontSize: ScreenAdaptor.size(28)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        bottom: 0,
                        width: 800,
                        child: Divider(color: Colors.grey, thickness: ScreenAdaptor.height(1)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: ScreenAdaptor.height(130),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: ScreenAdaptor.height(108),
                            margin: EdgeInsets.all(ScreenAdaptor.size(5)),
                            child: Text(
                              "联系电话 : ",
                              style: TextStyle(color: MyColors.mainBackgroundColor, fontSize: ScreenAdaptor.size(32)),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(ScreenAdaptor.size(5)),
                            alignment: Alignment.center,
                            color: Colors.white,
                            height: ScreenAdaptor.height(100),
                            width: ScreenAdaptor.width(300),
                            child: TextField(
                              enabled: false,
                              onChanged: (value) {},
                              style: TextStyle(fontSize: ScreenAdaptor.size(28)),
                              maxLines: 1,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: '${user.userName}',
                                hintStyle: TextStyle(color: Colors.grey, fontSize: ScreenAdaptor.size(28)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        bottom: 0,
                        width: 800,
                        child: Divider(color: Colors.grey, thickness: ScreenAdaptor.height(1)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () async {
                Result? result = await CityPickers.showCityPicker(
                  context: context,
                  locationCode: "130102",
                  cancelWidget: Text("取消", style: TextStyle(color: MyColors.mainBackgroundColor, fontSize: ScreenAdaptor.size(32))),
                  confirmWidget: Text("确定", style: TextStyle(color: MyColors.mainBackgroundColor, fontSize: ScreenAdaptor.size(32))),
                );
                setState(() {
                  user.address = "${result!.provinceName}/${result.cityName}/${result.areaName}";
                });
              },
              child: SizedBox(
                height: ScreenAdaptor.height(130),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: ScreenAdaptor.height(108),
                              margin: EdgeInsets.all(ScreenAdaptor.size(5)),
                              child: Icon(
                                Icons.add_location,
                                size: ScreenAdaptor.size(50),
                                color: MyColors.mainBackgroundColor,
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.all(ScreenAdaptor.size(5)),
                                alignment: Alignment.centerLeft,
                                color: Colors.white,
                                height: ScreenAdaptor.height(100),
                                width: ScreenAdaptor.width(500),
                                child:
                                    user.address != null ? Text(user.address!, style: TextStyle(fontSize: ScreenAdaptor.size(28))) : Text('省/市/区', style: TextStyle(fontSize: ScreenAdaptor.size(28))))
                          ],
                        ),
                        Positioned(
                          bottom: 0,
                          width: 800,
                          child: Divider(color: Colors.grey, thickness: ScreenAdaptor.height(1)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: ScreenAdaptor.height(130),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: ScreenAdaptor.height(108),
                            margin: EdgeInsets.all(ScreenAdaptor.size(5)),
                            child: Text(
                              "详细地址 : ",
                              style: TextStyle(color: MyColors.mainBackgroundColor, fontSize: ScreenAdaptor.size(32)),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(ScreenAdaptor.size(5)),
                            alignment: Alignment.center,
                            color: Colors.white,
                            height: ScreenAdaptor.height(100),
                            width: ScreenAdaptor.width(500),
                            child: TextField(
                              onChanged: (value) {
                                user.address2 = value;
                              },
                              style: TextStyle(fontSize: ScreenAdaptor.size(28)),
                              maxLines: 1,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: user.address2,
                                hintStyle: TextStyle(color: Colors.grey, fontSize: ScreenAdaptor.size(28)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        bottom: 0,
                        width: 800,
                        child: Divider(color: Colors.grey, thickness: ScreenAdaptor.height(1)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: ScreenAdaptor.height(300),
              child: Container(
                alignment: Alignment.center,
                child: MaterialButton(
                  color: MyColors.mainBackgroundColor,
                  minWidth: double.infinity,
                  padding: EdgeInsets.all(ScreenAdaptor.height(25)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(ScreenAdaptor.size(36)),
                  ),
                  child: Text(
                    "保存地址",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: ScreenAdaptor.size(30),
                    ),
                  ),
                  onPressed: () async {
                    //加密签名
                    var tempJson = {"id": user.id, "userName": user.userName, "address": user.address, "address2": user.address2, "salt": user.salt};
                    var sign = SignService.getSign(tempJson);
                    //将user信息传回服务器
                    Response response = await Dio().post(BasicConfig.basicServerUrl + ServerInterface.editAddress, data: {
                      "id": user.id,
                      "userName": user.userName,
                      "address": user.address,
                      "address2": user.address2,
                      "sign": sign,
                    });
                    //分析response
                    Map data = response.data;
                    if (data["code"] == 200) {
                      //保存成功,将改动写回本地
                      UserService.setUserToLocal(user);
                      Fluttertoast.showToast(msg: "保存成功");
                      Navigator.pop(context);
                    } else {
                      //保存失败
                      Fluttertoast.showToast(
                        msg: "保存失败 : " + data["msg"],
                        backgroundColor: Colors.red[300],
                        toastLength: Toast.LENGTH_LONG,
                        gravity: ToastGravity.CENTER,
                      );
                      return;
                    }
                    //重新读回本地user信息
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
