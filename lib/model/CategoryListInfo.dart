///分类页面左侧列表数据
class CategoryListInfo {
  int? nowtime;
  int? code;
  List<CategoryList>? categoryList;

  CategoryListInfo.fromJson(Map<String, dynamic> json) {
    nowtime = json['nowtime'];
    code = json['code'];
    if (json['list'] != null) {
      categoryList = <CategoryList>[];
      json['list'].forEach((v) {
        categoryList?.add(CategoryList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['nowtime'] = nowtime;
    json['code'] = code;
    if (categoryList != null) {
      json['list'] = categoryList?.map((v) => v.toJson()).toList();
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
