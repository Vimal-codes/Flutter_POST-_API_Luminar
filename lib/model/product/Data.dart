import 'dart:convert';

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      this.id, 
      this.name, 
      this.description, 
      this.price, 
      this.stock, 
      this.category, 
      this.imageUrl, 
      this.user,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    stock = json['stock'];
    category = json['category'];
    imageUrl = json['image_url'];
    user = json['user'];
  }
  num? id;
  String? name;
  String? description;
  num? price;
  num? stock;
  String? category;
  dynamic imageUrl;
  dynamic user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['description'] = description;
    map['price'] = price;
    map['stock'] = stock;
    map['category'] = category;
    map['image_url'] = imageUrl;
    map['user'] = user;
    return map;
  }

}