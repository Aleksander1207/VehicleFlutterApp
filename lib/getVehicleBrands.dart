import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class VehicleBrands {
  final List<dynamic> brands;

  VehicleBrands({this.brands});

  factory VehicleBrands.fromJson(Map<String,dynamic> json){
    return VehicleBrands(
      brands: json['data']['results'],
    );
  }
}

Future<VehicleBrands> getVehicleBrands(String cookie,bool outdated) async {
  String fileName = 'CacheBrands.json';
  final cacheDir = await getTemporaryDirectory();

  if(await File(cacheDir.path + '/' + fileName).exists() && !outdated){
    print('Loading brands from cache');
    var jsonData = File(cacheDir.path + '/' + fileName).readAsBytesSync();
    VehicleBrands brands = VehicleBrands.fromJson(jsonDecode(utf8.decode(jsonData)));
    return brands;
  }
  else{
    print('Loading brands from API');
    final http.Response response = await http.get(
      'https://gara6.bg/auto-api/vehicleBrands?pageSize=2147483647',
      headers: <String, String>{
        'Content-Type': 'application/json',
        'cookie':cookie,
      },
    );

    if(response.statusCode==200){
      VehicleBrands res = VehicleBrands.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));

      var tempDir = await getTemporaryDirectory();
      File file = new File(tempDir.path + '/' + fileName);
      file.writeAsBytesSync(response.bodyBytes,flush: true,mode: FileMode.write);
      return res;
    }
    else{
      throw Exception('Failed to retrieve vehicle brands');
    }
  }
}