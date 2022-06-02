import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutterjdshop/config/response_code.dart';
import 'package:flutterjdshop/model/user.dart';
import 'package:flutterjdshop/services/my_utils.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../config/basic_config.dart';
import '../config/server_interface.dart';
import '../services/screen_adaptor.dart';
import '../widgets/my_colors.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isChecked = false;
  String labelTextPhone = "";
  String labelTextRepassword = "";
  String labelTextNickName = "";
  String phoneNumber = "";
  String password = "";
  String rePassword = "";
  String nickName = "";

  @override
  Widget build(BuildContext context) {
    ScreenAdaptor.init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: ScreenAdaptor.getScreenHeight(),
          padding: EdgeInsets.all(ScreenAdaptor.size(50)),
          color: Colors.white,
          child: Flex(
            direction: Axis.vertical,
            children: [
              Expanded(flex: 2, child: Container()),
              Expanded(
                flex: 5,
                child: Container(
                  alignment: Alignment.centerRight,
                  child: IconButton(
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
              Expanded(
                flex: 8,
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "欢迎注册",
                    style: TextStyle(fontSize: ScreenAdaptor.size(56)),
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "已有账号?",
                        style: TextStyle(fontSize: ScreenAdaptor.size(26), color: Colors.black38),
                      ),
                      SizedBox(
                        width: ScreenAdaptor.width(10),
                      ),
                      InkWell(
                        child: Text(
                          "登录",
                          style: TextStyle(fontSize: ScreenAdaptor.size(26), color: MyColors.mainBackgroundColor),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.pushNamed(context, '/login');
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 10,
                child: Flex(
                  direction: Axis.horizontal,
                  children: [
                    Expanded(
                        flex: 13,
                        child: Text(
                          "手机号",
                          style: TextStyle(
                            fontSize: ScreenAdaptor.size(28),
                            color: Colors.black,
                          ),
                        )),
                    Expanded(
                        flex: 50,
                        child: TextField(
                          onChanged: (value) {
                            if (MyUtils.isPhone(value)) {
                              //匹配电话规则
                              setState(() {
                                labelTextPhone = "";
                              });
                            } else {
                              setState(() {
                                labelTextPhone = "请正确填写电话号码";
                              });
                            }
                            phoneNumber = value;
                          },
                          style: TextStyle(fontSize: ScreenAdaptor.size(28)),
                          maxLines: 1,
                          decoration: InputDecoration(
                            hintText: '手机号码作为登录名',
                            hintStyle: TextStyle(color: Colors.grey, fontSize: ScreenAdaptor.size(28)),
                            isCollapsed: false,
                            helperMaxLines: 1,
                            contentPadding: EdgeInsets.all(ScreenAdaptor.size(20)),
                            labelText: labelTextPhone,
                            labelStyle: TextStyle(
                              fontSize: ScreenAdaptor.size(23),
                              color: Colors.redAccent,
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: MyColors.mainBackgroundColor,
                                style: BorderStyle.solid,
                                width: 2,
                              ),
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: MyColors.mainBackgroundColor,
                                style: BorderStyle.solid,
                                width: 2,
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              Expanded(
                flex: 10,
                child: Flex(
                  direction: Axis.horizontal,
                  children: [
                    Expanded(
                        flex: 13,
                        child: Text(
                          "密码",
                          style: TextStyle(
                            fontSize: ScreenAdaptor.size(28),
                            color: Colors.black,
                          ),
                        )),
                    Expanded(
                        flex: 50,
                        child: TextField(
                          onChanged: (value) {
                            password = value;
                            if (checkPassword()) {
                              setState(() {
                                labelTextRepassword = "";
                              });
                            } else {
                              setState(() {
                                labelTextRepassword = "两次输入密码不一致";
                              });
                            }
                          },
                          style: TextStyle(fontSize: ScreenAdaptor.size(28)),
                          maxLines: 1,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: '请输入密码',
                            hintStyle: TextStyle(color: Colors.grey, fontSize: ScreenAdaptor.size(28)),
                            isCollapsed: false,
                            helperMaxLines: 1,
                            contentPadding: EdgeInsets.all(ScreenAdaptor.size(20)),
                            labelText: "",
                            labelStyle: TextStyle(
                              fontSize: ScreenAdaptor.size(23),
                              color: Colors.redAccent,
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: MyColors.mainBackgroundColor,
                                style: BorderStyle.solid,
                                width: 2,
                              ),
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: MyColors.mainBackgroundColor,
                                style: BorderStyle.solid,
                                width: 2,
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              Expanded(
                flex: 10,
                child: Flex(
                  direction: Axis.horizontal,
                  children: [
                    Expanded(
                        flex: 13,
                        child: Text(
                          "重复密码",
                          style: TextStyle(
                            fontSize: ScreenAdaptor.size(28),
                            color: Colors.black,
                          ),
                        )),
                    Expanded(
                        flex: 50,
                        child: TextField(
                          onChanged: (value) {
                            rePassword = value;
                            if (checkPassword()) {
                              setState(() {
                                labelTextRepassword = "";
                              });
                            } else {
                              setState(() {
                                labelTextRepassword = "两次输入密码不一致";
                              });
                            }
                          },
                          style: TextStyle(fontSize: ScreenAdaptor.size(28)),
                          maxLines: 1,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: '再次输入密码',
                            hintStyle: TextStyle(color: Colors.grey, fontSize: ScreenAdaptor.size(28)),
                            isCollapsed: false,
                            helperMaxLines: 1,
                            contentPadding: EdgeInsets.all(ScreenAdaptor.size(20)),
                            labelText: labelTextRepassword,
                            labelStyle: TextStyle(
                              fontSize: ScreenAdaptor.size(28),
                              color: Colors.redAccent,
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: MyColors.mainBackgroundColor,
                                style: BorderStyle.solid,
                                width: 2,
                              ),
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: MyColors.mainBackgroundColor,
                                style: BorderStyle.solid,
                                width: 2,
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              Expanded(
                flex: 10,
                child: Flex(
                  direction: Axis.horizontal,
                  children: [
                    Expanded(
                        flex: 13,
                        child: Text(
                          "昵称",
                          style: TextStyle(
                            fontSize: ScreenAdaptor.size(28),
                            color: Colors.black,
                          ),
                        )),
                    Expanded(
                        flex: 50,
                        child: TextField(
                          onChanged: (value) {
                            nickName = value;
                            if (value.isNotEmpty) {
                              setState(() {
                                labelTextNickName = "";
                              });
                            } else {
                              setState(() {
                                labelTextNickName = "请输入昵称";
                              });
                            }
                          },
                          style: TextStyle(fontSize: ScreenAdaptor.size(28)),
                          maxLines: 1,
                          decoration: InputDecoration(
                            hintText: '请输入昵称',
                            hintStyle: TextStyle(color: Colors.grey, fontSize: ScreenAdaptor.size(28)),
                            isCollapsed: false,
                            helperMaxLines: 1,
                            contentPadding: EdgeInsets.all(ScreenAdaptor.size(20)),
                            labelText: "",
                            labelStyle: TextStyle(
                              fontSize: ScreenAdaptor.size(23),
                              color: Colors.redAccent,
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: MyColors.mainBackgroundColor,
                                style: BorderStyle.solid,
                                width: 2,
                              ),
                            ),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide(
                                color: MyColors.mainBackgroundColor,
                                style: BorderStyle.solid,
                                width: 2,
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              Expanded(
                flex: 10,
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
                      "注册",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: ScreenAdaptor.size(30),
                      ),
                    ),
                    onPressed: () async {
                      //校验表单
                      if (!MyUtils.isPhone(phoneNumber)) {
                        Fluttertoast.showToast(
                          msg: "请检查手机号码格式!",
                          backgroundColor: Colors.redAccent,
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.CENTER,
                        );
                        return;
                      }
                      if (!checkPassword()) {
                        Fluttertoast.showToast(
                          msg: "两次密码输入不一致!",
                          backgroundColor: Colors.redAccent,
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.CENTER,
                        );
                        return;
                      }
                      if (!isChecked) {
                        Fluttertoast.showToast(
                          msg: "请勾选阅读并接受协议",
                          backgroundColor: Colors.redAccent,
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.CENTER,
                        );
                        return;
                      }
                      if (nickName.isEmpty) {
                        Fluttertoast.showToast(
                          msg: "请填写昵称",
                          backgroundColor: Colors.redAccent,
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.CENTER,
                        );
                        return;
                      }
                      //查找服务器是否此用户名已被使用
                      //使用md5对password加密

                      User user = User(userName: phoneNumber, password: MyUtils.generateMD5(password), nickName: nickName);
                      var response1 = await Dio().get(BasicConfig.basicServerUrl + ServiceInterface.isUserExists, queryParameters: {"user_name": user.userName});
                      //用户名已被使用
                      if (response1.data['is_user_exists'] == true) {
                        Fluttertoast.showToast(
                          msg: "此手机号已注册,请直接登录",
                          backgroundColor: Colors.redAccent,
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.CENTER,
                        );
                        setState(() {
                          labelTextPhone = "该手机号已被使用";
                        });
                        return;
                      }
                      //表单校验没有问题,开始保存
                      var response2 = await Dio().post(BasicConfig.basicServerUrl + ServiceInterface.saveUser,data: user.toJson());
                      if (response2.data['code'] == ResponseCode.success) {
                        //保存成功
                        Fluttertoast.showToast(
                          msg: "注册成功!",
                          backgroundColor: Colors.black26,
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.CENTER,
                        );
                        //关闭本页并跳转至登录页
                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/login');
                      } else if (response2.data['code'] == ResponseCode.error) {
                        //保存失败
                        Fluttertoast.showToast(
                          msg: response2.data['msg'],
                          backgroundColor: Colors.redAccent,
                          toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.CENTER,
                        );
                        return;
                      }
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 10,
                child: Container(
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  ///检查两次输入的密码是否一致
  bool checkPassword() {
    if (password == rePassword) {
      return true;
    } else {
      return false;
    }
  }
}
