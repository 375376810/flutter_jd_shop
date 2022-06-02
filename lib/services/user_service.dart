import 'dart:convert';

import 'package:flutterjdshop/services/storage_service.dart';

import '../model/user.dart';

class UserService {
  static setUserToLocal(User user) async {
    StorageService.setString("user", json.encode(user));
  }

  static Future<User?> getUserFromLocal() async {
    //从本地配置文件中读取用户信息
    try {
      String? val = await StorageService.getString('user');
      if (val != null) {
        var userJson = json.decode(val);
        User user = User.fromJson(userJson);
        return user;
      }
    } catch (e) {
      print(e);
      return null;
    }
    return null;
  }

  static Future<bool> isLogin() async {
    bool state = false;
    User? user = await getUserFromLocal();
    if (user != null) {
      state = true;
    }
    return state;
  }
}
