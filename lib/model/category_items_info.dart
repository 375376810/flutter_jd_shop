///分类页面右侧数据
class CategoryItemsInfo {
  int? code;
  int? time;
  List<CategoryItems>? categoryItems;

  CategoryItemsInfo.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    time = json['time'];
    if (json['categoryItems'] != null) {
      categoryItems = <CategoryItems>[];
      json['categoryItems'].forEach((v) {
        categoryItems?.add(CategoryItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['code'] = code;
    json['time'] = time;
    if (categoryItems != null) {
      json['categoryItems'] = categoryItems?.map((v) => v.toJson()).toList();
    }
    return json;
  }
}

class CategoryItems {
  int? id;
  int? categoryListId;
  String? title;
  double? price;
  String? desc;
  String? url;
  String? sort;

  CategoryItems({this.id,this.categoryListId, this.title, this.price, this.desc,this.url, this.sort});

  CategoryItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryListId = json['categoryListId'];
    title = json['title'];
    price = json['price'];
    desc = json['desc'];
    url = json['url'];
    sort = json['sort'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['categoryListId'] = categoryListId;
    json['title'] = title;
    json['price'] = price;
    json['desc'] = desc;
    json['url'] = url;
    json['sort'] = sort;
    return json;
  }
}