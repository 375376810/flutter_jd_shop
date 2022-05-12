class HotProductItemsCountInfo {
  int? code;
  int? time;
  int? hotProductItemsCount;

  HotProductItemsCountInfo({this.code, this.time, this.hotProductItemsCount});

  HotProductItemsCountInfo.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    time = json['time'];
    hotProductItemsCount = json['HotProductItemsCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['time'] = time;
    data['HotProductItemsCount'] = hotProductItemsCount;
    return data;
  }
}