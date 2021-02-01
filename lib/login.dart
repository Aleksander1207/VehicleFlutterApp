import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ResponseData {
  final String email;
  final String cookie;

  ResponseData({this.email,this.cookie});

  factory ResponseData.fromJson(Map<String,dynamic> json,String responseCookie){
    return ResponseData(
      email: json['data']['email'],
      cookie:responseCookie,
    );
  }
}

Future<ResponseData> createRequest(String email,String pass) async{
  final http.Response response = await http.post(
    'https://gara6.bg/auto-api/users/login',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': email, 'password': pass,
    }),
  );

  if(response.statusCode==200){
    return ResponseData.fromJson(jsonDecode(response.body),response.headers['set-cookie']);
  }
  else{
    throw Exception('Failed to log in');
  }
}