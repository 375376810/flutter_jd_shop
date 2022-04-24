///分类页面右侧数据
class CategoryItemsInfo {
  int? nowtime;
  int? code;
  List<CategoryItems>? categoryItems;

  CategoryItemsInfo.fromJson(Map<String, dynamic> json) {
    nowtime = json['nowtime'];
    code = json['code'];
    if (json['categoryItems'] != null) {
      categoryItems = <CategoryItems>[];
      json['categoryItems'].forEach((v) {
        categoryItems?.add(CategoryItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['nowtime'] = nowtime;
    json['code'] = code;
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
  String? status;
  String? desc;
  String? sort;

  CategoryItems({this.id,this.categoryListId, this.title, this.status, this.desc, this.sort});

  CategoryItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryListId = json['categoryListId'];
    title = json['title'];
    status = json['status'];
    desc = json['pic'];
    sort = json['sort'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['categoryListId'] = categoryListId;
    json['title'] = title;
    json['status'] = status;
    json['pic'] = desc;
    json['sort'] = sort;
    return json;
  }
}