import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class VehicleTypes {
  final List<dynamic> types;

  VehicleTypes({this.types});

  factory VehicleTypes.fromJson(Map<String, dynamic> json){
    return VehicleTypes(
      types: json['data']['results'],
    );
  }
}

  Future<VehicleTypes> getVehicleTypes(String cookie,bool outdated) async {
    String fileName = 'CacheTypes.json';
    final cacheDir = await getTemporaryDirectory();

    if(await File(cacheDir.path + '/' + fileName).exists() && !outdated){
      print('Loading types from cache');
      var jsonData = File(cacheDir.path + '/' + fileName).readAsBytesSync();
      VehicleTypes types = VehicleTypes.fromJson(jsonDecode(utf8.decode(jsonData)));
      return types;
    }
    else{
      print('Loading types from API');
      final http.Response response = await http.get(
        'https://gara6.bg/auto-api/vehicleTypes?pageSize=2147483647',
        headers: <String, String>{
          'Content-Type': 'application/json',
          'cookie':cookie,
        },
      );

      if(response.statusCode == 200){
        VehicleTypes res = VehicleTypes.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));

        var tempDir = await getTemporaryDirectory();
        File file = new File(tempDir.path + '/' + fileName);
        file.writeAsBytesSync(response.bodyBytes, flush: true, mode: FileMode.write);
        return res;
      }
      else{
        throw Exception('Failed to retrieve vehicle types');
      }
    }
  }
