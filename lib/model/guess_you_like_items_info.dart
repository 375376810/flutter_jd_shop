class GuessYouLikeItemsInfo {
  int? code;
  int? time;
  List<GuessYouLikeItems>? guessYouLikeItems;

  GuessYouLikeItemsInfo({this.code, this.time, this.guessYouLikeItems});

  GuessYouLikeItemsInfo.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    time = json['time'];
    if (json['guessYouLikeItems'] != null) {
      guessYouLikeItems = <GuessYouLikeItems>[];
      json['guessYouLikeItems'].forEach((v) {
        guessYouLikeItems!.add(GuessYouLikeItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['time'] = time;
    if (guessYouLikeItems != null) {
      data['guessYouLikeItems'] =
          guessYouLikeItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GuessYouLikeItems {
  int? id;
  String? gsId;
  String? title;
  double? price;
  String? desc;
  String? url;
  String? sort;

  GuessYouLikeItems(
      {this.id,
        this.gsId,
        this.title,
        this.price,
        this.desc,
        this.url,
        this.sort});

  GuessYouLikeItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    gsId = json['gsId'];
    title = json['title'];
    price = json['price'];
    desc = json['desc'];
    url = json['url'];
    sort = json['sort'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['gsId'] = gsId;
    data['title'] = title;
    data['price'] = price;
    data['desc'] = desc;
    data['url'] = url;
    data['sort'] = sort;
    return data;
  }
}