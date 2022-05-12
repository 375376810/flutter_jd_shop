class HotProductItemsInfo {
  int? code;
  int? time;
  List<HotProductItemsByPage>? hotProductItemsByPage;

  HotProductItemsInfo({this.code, this.time, this.hotProductItemsByPage});

  HotProductItemsInfo.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    time = json['time'];
    if (json['hotProductItemsByPage'] != null) {
      hotProductItemsByPage = <HotProductItemsByPage>[];
      json['hotProductItemsByPage'].forEach((v) {
        hotProductItemsByPage!.add(HotProductItemsByPage.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['time'] = time;
    if (hotProductItemsByPage != null) {
      data['hotProductItemsByPage'] =
          hotProductItemsByPage!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HotProductItemsByPage {
  int? id;
  int? listId;
  String? title;
  double? price;
  String? desc;
  String? url;
  String? sort;

  HotProductItemsByPage(
      {this.id,
        this.listId,
        this.title,
        this.price,
        this.desc,
        this.url,
        this.sort});

  HotProductItemsByPage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    listId = json['listId'];
    title = json['title'];
    price = json['price'];
    desc = json['desc'];
    url = json['url'];
    sort = json['sort'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['listId'] = listId;
    data['title'] = title;
    data['price'] = price;
    data['desc'] = desc;
    data['url'] = url;
    data['sort'] = sort;
    return data;
  }
}