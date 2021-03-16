import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class UserData{
  final String fName;
  final String lName;
  final String email;
  final String cookie;

  UserData({this.fName,this.lName,this.email,this.cookie});

  factory UserData.fromJson(Map<String,dynamic> json,String responseCookie){
    return UserData(
      fName:json['data']['fName'],
      lName: json['data']['lName'],
      email: json['data']['email'],
      cookie: responseCookie,
    );
  }
}

Future<UserData> getUser(String cookie)async{
  final http.Response response = await http.get(
    'https://gara6.bg/auto-api/users/me',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'cookie':cookie,
    },
  );

  if(response.statusCode==200){
    return UserData.fromJson(jsonDecode(response.body),cookie);
  }
  else{
    throw Exception('Failed to retrieve user data');
  }
}