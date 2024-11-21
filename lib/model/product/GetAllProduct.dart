import 'Data.dart';
import 'dart:convert';

GetAllProduct getAllProductFromJson(String str) => GetAllProduct.fromJson(json.decode(str));
String getAllProductToJson(GetAllProduct data) => json.encode(data.toJson());
class GetAllProduct {
  GetAllProduct({
      this.msg, 
      this.data,});

  GetAllProduct.fromJson(dynamic json) {
    msg = json['Msg'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  String? msg;
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Msg'] = msg;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}