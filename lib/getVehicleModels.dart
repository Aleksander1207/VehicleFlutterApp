import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class VehicleModels {
  final List<dynamic> data;

  VehicleModels({this.data});

  factory VehicleModels.fromJson(Map<String, dynamic> json) {
    return VehicleModels(
      data: json['data']['results'],
    );
  }
}

Future<VehicleModels> getVehicleModels(String cookie,bool outdated) async {
  String fileName = 'CacheModels.json';
  var cacheDir = await getTemporaryDirectory();

  if (await File(cacheDir.path + '/' + fileName).exists() && !outdated) {
    print('Loading models from cache');
    var jsonData = File(cacheDir.path + '/' + fileName).readAsBytesSync();
    VehicleModels models = VehicleModels.fromJson(jsonDecode(utf8.decode(jsonData)));
    return models;
  }
  else {
    print('Loading models from API');
    final http.Response response = await http.get(
      'https://gara6.bg/auto-api/vehicleModels?pageSize=2147483647',
      headers: <String, String>{
        'Content-Type': 'application/json',
        'cookie': cookie,
      },
    );

    if (response.statusCode == 200) {
      VehicleModels res = VehicleModels.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));

      var tempDir = await getTemporaryDirectory();
      File file = new File(tempDir.path + '/' + fileName);
      file.writeAsBytesSync(response.bodyBytes, flush: true, mode: FileMode.write);
      return res;
    }
    else {
      throw Exception('Failed to retrieve vehicle models');
    }
  }
}
