import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutterjdshop/model/user.dart';
import 'package:flutterjdshop/services/my_utils.dart';
import 'package:flutterjdshop/services/screen_adaptor.dart';
import 'package:flutterjdshop/services/user_service.dart';
import 'package:flutterjdshop/widgets/my_colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../config/basic_config.dart';
import '../config/server_interface.dart';

///登录页
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  bool isChecked = true;
  String userName = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    ScreenAdaptor.init(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          InkWell(
            onTap: () {
              //进入注册页面
              Navigator.pop(context);
              Navigator.pushNamed(context, '/sign_up');
            },
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(ScreenAdaptor.width(10)),
              padding: EdgeInsets.all(ScreenAdaptor.width(10)),
              child: Text(
                '注册',
                style: TextStyle(
                  fontSize: ScreenAdaptor.size(30),
                ),
              ),
            ),
          ),
        ],
        foregroundColor: MyColors.mainBackgroundColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          height: ScreenAdaptor.getScreenHeight() - 80,
          child: Flex(
            direction: Axis.vertical,
            children: [
              Expanded(
                  flex: 30,
                  child: Container(
                    alignment: Alignment.center,
                    child: ClipOval(
                      child: Container(
                        color: MyColors.mainBackgroundColor,
                        alignment: Alignment.center,
                        width: ScreenAdaptor.width(218),
                        height: ScreenAdaptor.height(223),
                        child: Text(
                          "LOGO",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenAdaptor.size(50),
                          ),
                        ),
                      ),
                    ),
                  )),
              Expanded(
                  flex: 80,
                  child: Container(
                    margin: EdgeInsets.all(ScreenAdaptor.width(38)),
                    child: Flex(
                      direction: Axis.vertical,
                      children: [
                        Expanded(
                          flex: 15,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Stack(
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.all(ScreenAdaptor.width(15)),
                                        height: ScreenAdaptor.height(108),
                                        child: Icon(
                                          Icons.portrait,
                                          size: ScreenAdaptor.size(58),
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.all(ScreenAdaptor.width(15)),
                                        color: Colors.white,
                                        height: ScreenAdaptor.height(100),
                                        width: ScreenAdaptor.width(500),
                                        child: TextField(
                                          onChanged: (value) {
                                            userName = value;
                                          },
                                          style: TextStyle(fontSize: ScreenAdaptor.size(28)),
                                          maxLines: 1,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: '输入用户名(手机号码)',
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
                              Stack(
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.all(ScreenAdaptor.width(15)),
                                        height: ScreenAdaptor.height(108),
                                        child: Icon(
                                          Icons.lock,
                                          size: ScreenAdaptor.size(58),
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.all(ScreenAdaptor.width(15)),
                                        color: Colors.white,
                                        height: ScreenAdaptor.height(100),
                                        width: ScreenAdaptor.width(500),
                                        child: TextField(
                                          onChanged: (value) {
                                            password = value;
                                          },
                                          style: TextStyle(fontSize: ScreenAdaptor.size(28)),
                                          maxLines: 1,
                                          obscureText: true,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: '输入密码',
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
                        Expanded(
                          flex: 8,
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
                                "一键登录",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: ScreenAdaptor.size(30),
                                ),
                              ),
                              onPressed: () async {
                                //非空验证
                                checkEmpty();
                                //通过非空验证后,将密码md5加密
                                password = MyUtils.generateMD5(password);
                                //请求接口
                                var response = await Dio().post(BasicConfig.basicServerUrl + ServiceInterface.login, queryParameters: {"user_name": userName, "password": password});
                                var data = response.data["user"];
                                if (data == null) {
                                  Fluttertoast.showToast(
                                    msg: "用户名或密码错误!",
                                    backgroundColor: Colors.redAccent,
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                  );
                                  return;
                                } else {
                                  User user = User.fromJson(data);
                                  //将获取到的user数据写到本地配置文件中
                                  UserService.setUserToLocal(user);
                                  Navigator.pop(context);
                                  Fluttertoast.showToast(
                                    msg: "登录成功!",
                                    backgroundColor: Colors.black38,
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 10,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.all(ScreenAdaptor.width(5)),
                                child: Chip(
                                  label: Text(
                                    "支付宝快捷登录",
                                    style: TextStyle(fontSize: ScreenAdaptor.size(25)),
                                  ),
                                  labelPadding: EdgeInsets.symmetric(horizontal: ScreenAdaptor.width(15)),
                                  avatar: ClipOval(
                                    child: Image.asset("images/zfb.png", fit: BoxFit.cover, width: ScreenAdaptor.width(38), height: ScreenAdaptor.height(38)),
                                  ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(ScreenAdaptor.height(20)),
                                height: ScreenAdaptor.height(100),
                                child: Wrap(
                                  direction: Axis.horizontal,
                                  alignment: WrapAlignment.spaceEvenly,
                                  spacing: ScreenAdaptor.width(15),
                                  runSpacing: ScreenAdaptor.width(15),
                                  children: [
                                    SizedBox(
                                      width: ScreenAdaptor.width(28),
                                      height: ScreenAdaptor.height(28),
                                      child: Transform.scale(
                                        scale: 0.68,
                                        child: Checkbox(
                                          materialTapTargetSize: MaterialTapTargetSize.padded,
                                          activeColor: MyColors.mainBackgroundColor,
                                          checkColor: Colors.white,
                                          value: isChecked,
                                          shape: const CircleBorder(),
                                          onChanged: (bool? value) {
                                            setState(() {
                                              isChecked = value!;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "已阅读并同意",
                                      style: TextStyle(fontSize: ScreenAdaptor.size(21), color: isChecked ? MyColors.mainBackgroundColor : Colors.black45),
                                    ),
                                    Text(
                                      "《电商平台服务协议》",
                                      style: TextStyle(fontSize: ScreenAdaptor.size(21), color: Colors.black),
                                    ),
                                    Text(
                                      "《隐私权政策》",
                                      style: TextStyle(fontSize: ScreenAdaptor.size(21), color: Colors.black),
                                    ),
                                    Text(
                                      "《支付宝注册相关协议》",
                                      style: TextStyle(fontSize: ScreenAdaptor.size(21), color: Colors.black),
                                    ),
                                    Text(
                                      "《联通同意认证服务条款》",
                                      style: TextStyle(fontSize: ScreenAdaptor.size(21), color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  void checkEmpty() {
    if (userName.isEmpty || password.isEmpty) {
      Fluttertoast.showToast(
        msg: "用户名或密码没有填写",
        backgroundColor: Colors.redAccent,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
      );
      return;
    }
  }
}
