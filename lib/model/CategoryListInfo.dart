///分类页面左侧列表数据
class CategoryListInfo {
  int? code;
  int? time;
  List<CategoryList>? categoryList;

  CategoryListInfo.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    time = json['time'];
    if (json['categoryList'] != null) {
      categoryList = <CategoryList>[];
      json['categoryList'].forEach((v) {
        categoryList?.add(CategoryList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['time'] = time;
    json['code'] = code;
    if (categoryList != null) {
      json['categoryList'] = categoryList?.map((v) => v.toJson()).toList();
    }
    return json;
  }
}

class CategoryList {
  int? id;
  String? title;
  String? status;
  String? desc;
  String? sort;

  CategoryList({this.id, this.title, this.status, this.desc, this.sort});

  CategoryList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    status = json['status'];
    desc = json['pic'];
    sort = json['sort'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['title'] = title;
    json['status'] = status;
    json['pic'] = desc;
    json['sort'] = sort;
    return json;
  }
}
