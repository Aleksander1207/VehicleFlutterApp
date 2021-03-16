import 'dart:async';
import 'package:http/http.dart' as http;

Future<int> logOut(String cookie) async{
  final http.Response response = await http.post(
    'https://gara6.bg/auto-api/users/logout',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'cookie':'GARA6_SC=6815bd09-3c03-4738-b01d-c35d86bb7004; $cookie',
    },
  );

  if(response.statusCode==200){
    return (response.statusCode);
  }
  else{
    throw Exception("Failed to log out");
  }
}