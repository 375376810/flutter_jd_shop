import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///屏幕适配封装
class ScreenAdaptor {
  ///初始化
  static init(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(750, 1344));
  }

  ///设置高度
  static height(double height) {
    return ScreenUtil().setHeight(height);
  }

  ///设置宽度
  static width(double width) {
    return ScreenUtil().setWidth(width);
  }

  static size(double size) {
    return ScreenUtil().setSp(size);
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
