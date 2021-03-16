import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class ModelsChecksum {
  final String data;

  ModelsChecksum({this.data});

  factory ModelsChecksum.fromJson(Map<String,dynamic> json){
    return ModelsChecksum(
      data:json['data'],
    );
  }
}

Future<ModelsChecksum> getModelsChecksumAPI(String cookie)async{
  String fileName='CacheModelsChecksum.json';
  print('Loading models checksum from API function');
  final http.Response response = await http.get(
    'https://gara6.bg/auto-api/vehicleModels/checksum',
    headers: <String, String>{
      'Content-Type': 'application/json',
      'cookie':cookie,
    },
  );

  if(response.statusCode==200){
    ModelsChecksum res = ModelsChecksum.fromJson(jsonDecode(response.body));

    var tempDir = await getTemporaryDirectory();
    File file = new File(tempDir.path + '/' + fileName);
    file.writeAsStringSync(response.body,flush: true,mode: FileMode.write);
    return res;
  }
  else{
    throw Exception('Failed to retrieve vehicle models checksum');
  }
}

Future<ModelsChecksum> getModelsCheckSumCache(String cookie)async{
  String fileName='CacheModelsChecksum.json';
  var cacheDir= await getTemporaryDirectory();

  if(await File(cacheDir.path + '/' + fileName).exists()){
    print('Loading models checksum from cache');
    var jsonData = File(cacheDir.path + '/' + fileName).readAsStringSync();
    ModelsChecksum checksum = ModelsChecksum.fromJson(jsonDecode(jsonData));
    return checksum;
  }
  else{
    print('Loading models checksum from API cache function');
    final http.Response response = await http.get(
      'https://gara6.bg/auto-api/vehicleModels/checksum',
      headers: <String, String>{
        'Content-Type': 'application/json',
        'cookie':cookie,
      },
    );
    if(response.statusCode==200){
      ModelsChecksum res = ModelsChecksum.fromJson(jsonDecode(response.body));

      var tempDir = await getTemporaryDirectory();
      File file = new File(tempDir.path + '/' + fileName);
      file.writeAsStringSync(response.body,flush: true,mode: FileMode.write);
      return res;
    }
    else{
      throw Exception('Failed to retrieve vehicle models checksum');
    }
  }
}