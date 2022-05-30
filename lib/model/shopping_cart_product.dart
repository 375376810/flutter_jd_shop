class ShoppingCartProduct {
  String? title;
  String? desc;
  String? url;
  double? price;
  String? size;
  String? color;
  int? quantity;
  bool? selected = false;

  ShoppingCartProduct(this.title, this.desc, this.url, this.price, this.size, this.color, this.quantity);

  ShoppingCartProduct.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    desc = json['desc'];
    url = json['url'];
    price = json['price'];
    size = json['size'];
    color = json['color'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['desc'] = desc;
    data['url'] = url;
    data['price'] = price;
    data['size'] = size;
    data['color'] = color;
    data['quantity'] = quantity;
    return data;
  }
}
