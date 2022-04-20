import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///屏幕适配封装
class ScreenAdaptor {
  ///初始化
  static init(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(750, 1344),
        orientation: Orientation.portrait);
  }

  ///设置高度
  static setHeight(double height) {
    return ScreenUtil().setHeight(height);
  }

  ///设置宽度
  static setWidth(double width) {
    return ScreenUtil().setWidth(width);
  }

  ///获取当前设备高度 dp
  static getScreenHeight() {
    return ScreenUtil().screenHeight;
  }

  ///获取当前设备宽度 dp
  static getScreenWidth() {
    return ScreenUtil().screenWidth;
  }
}