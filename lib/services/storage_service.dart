
import 'package:shared_preferences/shared_preferences.dart';

///对shared_preferences的封装,用来存储配置文件
class StorageService {
  static Future<void> setString(key,value) async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString(key,value);
  }
  static Future<String?> getString(key) async{
    SharedPreferences sp=await SharedPreferences.getInstance();
    String? s =  sp.getString(key);
    return s;
  }
  static Future<void> remove(key) async{
    SharedPreferences sp=await SharedPreferences.getInstance();
    sp.remove(key);
  }
  static Future<void> clear() async{
    SharedPreferences sp=await SharedPreferences.getInstance();
    sp.clear();
  }

}