class ServerInterface {
  //获取轮播图的服务器接口
  static const String swiperInfo = "swiper_info";

  //分类页面左侧列表接口
  static const String categoryListInfo = "category_list_info";

  //分类页面右侧元素接口
  static const String categoryItemsInfo = "category_items_info";

  //热门商品总数量
  static const String getHotProductItemsCount = "get_hot_product_items_count";

  //分页查询热门商品
  static const String getHotProductItemsByPage = "get_hot_product_items_by_page";

  //猜你喜欢商品接口
  static const String guessYouLikeItemsInfo = "guess_you_like_items_info";

  //用户注册
  static const String saveUser = "save_user";

  //登录接口
  static const String login = "login";

  //查找数据库中是否已存在同名用户
  static const String isUserExists = "is_user_exists";

  //保存用户收获地址信息
  static const String editAddress = "edit_address";
}
