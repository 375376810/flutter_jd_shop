class User {
  int? id=1;
  String? userName;
  String? password;
  String? nickName;
  String? address;
  String? salt;
  int? gender;
  int? age;
  String? email;
  String? address2;

  User({this.id, this.userName, this.password, this.nickName, this.address, this.address2, this.salt, this.gender, this.age, this.email});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    password = json['password'];
    nickName = json['nickName'];
    address = json['address'];
    address2 = json['address2'];
    salt = json['salt'];
    gender = json['gender'];
    age = json['age'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userName'] = userName;
    data['password'] = password;
    data['nickName'] = nickName;
    data['address'] = address;
    data['address2'] = address2;
    data['salt'] = salt;
    data['gender'] = gender;
    data['age'] = age;
    data['email'] = email;
    return data;
  }
}
