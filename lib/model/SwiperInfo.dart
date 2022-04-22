class SwiperInfo {
  List<SwiperItems> resultList = <SwiperItems>[];

  SwiperInfo({required this.resultList});

  SwiperInfo.fromJson(Map<String, dynamic> json) {
    if (json['result'] != Null) {
      resultList = <SwiperItems>[];
      json['result'].forEach((items) {
        resultList.add(SwiperItems.fromJson(items));
      });
    }
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = <String, dynamic>{};
    if (resultList != null) {
      data['result'] = resultList.map((v) => v.toJson()).toList();
    }
    return data;
  }

}

class SwiperItems {
  String id = "";
  String title = "";
  String status = "";
  String pic = "";
  String url = "";

  SwiperItems(this.id, this.title, this.status, this.pic, this.url);

  SwiperItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    status = json['status'];
    pic = json['pic'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    Map<String,dynamic> data = <String,dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['status'] = status;
    data['pic'] = pic;
    data['url'] = url;
    return data;
  }
}
