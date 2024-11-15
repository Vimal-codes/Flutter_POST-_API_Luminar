import 'dart:convert';
import 'package:flutter_post_api_luminar/model/login/GetLoginData.dart';
import 'package:http/http.dart' as http;

class ApiService{

  final String baseUrl = "https://freeapi.luminartechnohub.com";

  Future<GetLoginData?> login(String email,  String password) async {
    var url = Uri.parse("$baseUrl/login");

    var header = {
      'accept': 'application/json',
      'Content-Type': 'application/json'
    };

    var body = jsonEncode(
      {
        'email' :  "${email}",
        'password' : "${password}"
      }
    );

    try{
      final response = await http.post(url, headers: header, body: body);
      if(response.statusCode >= 200 && response.statusCode <= 299){
        var responseData = jsonDecode(response.body);
        return GetLoginData.fromJson(responseData);
        print("${response.body}");
      }
    }catch (e){
      print("$e");
    }
  }

  Future<void> registration(String name, int phone, String place, int pincode, String email, String password) async {
    var url = Uri.parse("$baseUrl/registration/");

    var headers = {
      'accept': 'application/json',
      'Content-Type': 'application/json'
    };

    var body = jsonEncode(
      {
        "name": name,
        "phone": phone,
        "place": place,
        "pincode": pincode,
        "email": email,
        "password": password
      }
    );

    try{
      final response = await http.post(url, headers: headers, body: body);
      if(response.statusCode >= 200 && response.statusCode <= 299){
        var responseData = jsonDecode(response.body);
        print("Registration successful: $responseData");
      }
    }catch (e){
      print("$e");
    }
  }
}