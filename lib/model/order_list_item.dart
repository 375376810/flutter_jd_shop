class OrderListItem {
  int? id;
  int? productId;
  String? title;
  String? description;
  double? price;
  int? quantity;
  String? color;
  String? size;
  String? url;
  int? userId;
  String? userName;
  String? nickName;
  String? address;

  OrderListItem({this.id, this.productId, this.title, this.description, this.price, this.quantity, this.color, this.size, this.url, this.userId, this.userName, this.nickName, this.address});

  OrderListItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['productId'];
    title = json['title'];
    description = json['description'];
    price = json['price'];
    quantity = json['quantity'];
    color = json['color'];
    size = json['size'];
    url = json['url'];
    userId = json['userId'];
    userName = json['userName'];
    nickName = json['nickName'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id;
    json['productId'] = productId;
    json['title'] = title;
    json['description'] = description;
    json['price'] = price;
    json['quantity'] = quantity;
    json['color'] = color;
    json['size'] = size;
    json['url'] = url;
    json['userId'] = userId;
    json['userName'] = userName;
    json['nickName'] = nickName;
    json['address'] = address;
    return json;
  }
}
