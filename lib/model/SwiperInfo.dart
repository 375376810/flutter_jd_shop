class SwiperInfo {
  double nowtime = 0;
  int code = 0;
  List<SwiperItems>? swiperItems;

  SwiperInfo({required this.nowtime, required this.code, this.swiperItems});

  SwiperInfo.fromJson(Map<String, dynamic> json) {
    nowtime = json['nowtime'];
    code = json['code'];
    if (json['swiperItems'] != null) {
      swiperItems = <SwiperItems>[];
      json['swiperItems'].forEach((v) {
        swiperItems!.add(SwiperItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nowtime'] = nowtime;
    data['code'] = code;
    if (swiperItems != null) {
      data['swiperItems'] = swiperItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SwiperItems {
  int id = 0;
  String title = "";
  String status = "";
  String pic = "";
  String url = "";

  SwiperItems({required this.id, required this.title, required this.status, required this.pic, required this.url});

  SwiperItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    status = json['status'];
    pic = json['pic'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['status'] = status;
    data['pic'] = pic;
    data['url'] = url;
    return data;
  }
}
