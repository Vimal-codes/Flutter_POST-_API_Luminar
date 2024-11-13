import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiSrevice{

  final String baseUrl = "https://freeapi.luminartechnohub.com";

  Future<void> login(String email,  String password) async {
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
      final respone = await http.post(url, headers: header, body: body);
      if(respone.statusCode >= 200 && respone.statusCode <= 299){
        var responeData = jsonDecode(respone.body);
        print("${respone.body}");
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
      final respone = await http.post(url, headers: headers, body: body);
      if(respone.statusCode >= 200 && respone.statusCode <= 299){
        var responeData = jsonDecode(respone.body);
        print("${respone.body}");
      }
    }catch (e){
      print("$e");
    }
  }
}