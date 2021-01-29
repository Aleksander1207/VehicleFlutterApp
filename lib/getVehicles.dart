import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Vehicles {
  final List<dynamic> vehicles;

  Vehicles({this.vehicles});

  factory Vehicles.fromJson(Map<String,dynamic> json){
    return Vehicles(
      vehicles:json['data']['results'],
    );
  }
}

Future<Vehicles> getVehicles(String cookie)async{
  final http.Response response = await http.get(
    'https://gara6.bg/auto-api/vehicles',
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'cookie':cookie,
    },
  );

  print(response.body);

  if(response.statusCode==200){
    return Vehicles.fromJson(jsonDecode(response.body));
  }
  else{
    throw Exception('Failed to retrieve vehicles');
  }
}