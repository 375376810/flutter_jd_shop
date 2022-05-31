class MyUtils {
  //验证手机号
  //static RegExp reg = RegExp(r"^((13[0-9])|(14[5|7])|(15([0-3]|[5-9]))|(17[013678])|(18[0,5-9]))\\d{8}$");
  //static RegExp reg=RegExp(r'^((13[0-9])|(14[0-9])|(15[0-9])|(16[0-9])|(17[0-9])|(18[0-9])|(19[0-9]))\d{8}$');
  static RegExp reg =  RegExp(r"^1\d{10}$");

  ///验证手机号是否合法
  static bool isPhone(String phone) {
    if (reg.hasMatch(phone)) {
      return true;
    } else {
      return false;
    }
  }
}
