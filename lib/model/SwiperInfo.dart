class SwiperInfo {
  int? code;
  int? time;
  List<SwiperItems>? swiperItems;

  SwiperInfo({this.code, this.time, this.swiperItems});

  SwiperInfo.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    time = json['time'];
    if (json['swiperItems'] != null) {
      swiperItems = <SwiperItems>[];
      json['swiperItems'].forEach((v) {
        swiperItems!.add(SwiperItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['time'] = time;
    if (swiperItems != null) {
      data['swiperItems'] = swiperItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SwiperItems {
  int? id;
  String? title;
  String? status;
  String? pic;
  String? url;

  SwiperItems({this.id, this.title, this.status, this.pic, this.url});

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