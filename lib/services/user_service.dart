import 'dart:convert';

import 'package:flutterjdshop/services/storage_service.dart';

import '../model/user.dart';

class UserService {
  static setUser(User user) {

  }

  static getUser() async{
    //从本地配置文件中读取用户信息
    User? user;
    try {
      String? val = await StorageService.getString('user');
      if (val != null) {
        List data = json.decode(val);
        if (data.isNotEmpty) {
          user = data[0];
          return user;
        }
      }
    } catch (e) {
      print(e);
      return null;
    }
    return null;
  }
}