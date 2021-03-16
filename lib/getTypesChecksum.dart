import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class TypesChecksum {
  final String data;

  TypesChecksum({this.data});

  factory TypesChecksum.fromJson(Map<String,dynamic> json){
    return TypesChecksum(
      data:json['data'],
    );
  }
}

Future<TypesChecksum> getTypesChecksumAPI(String cookie)async{
  String fileName='CacheTypesChecksum.json';
  print('Loading types checksum from API function');
  final http.Response response = await http.get(
    'https://gara6.bg/auto-api/vehicleTypes/checksum',
    headers: <String, String>{
      'Content-Type': 'application/json',
      'cookie':cookie,
    },
  );

  if(response.statusCode==200){
    TypesChecksum res = TypesChecksum.fromJson(jsonDecode(response.body));

    var tempDir = await getTemporaryDirectory();
    File file = new File(tempDir.path + '/' + fileName);
    file.writeAsStringSync(response.body,flush: true,mode: FileMode.write);
    return res;
  }
  else{
    throw Exception('Failed to retrieve vehicle types checksum');
  }
}

Future<TypesChecksum> getTypesCheckSumCache(String cookie)async{
  String fileName='CacheTypesChecksum.json';
  var cacheDir= await getTemporaryDirectory();
  if(await File(cacheDir.path + '/' + fileName).exists()){
    print('Loading types checksum from cache');
    var jsonData=File(cacheDir.path + '/' + fileName).readAsStringSync();
    TypesChecksum checksum = TypesChecksum.fromJson(jsonDecode(jsonData));
    return checksum;
  }
  else{
    print('Loading types checksum from API cache function');
    final http.Response response = await http.get(
      'https://gara6.bg/auto-api/vehicleTypes/checksum',
      headers: <String, String>{
        'Content-Type': 'application/json',
        'cookie':cookie,
      },
    );
    if(response.statusCode==200){
      TypesChecksum res = TypesChecksum.fromJson(jsonDecode(response.body));

      var tempDir = await getTemporaryDirectory();
      File file = new File(tempDir.path + '/' + fileName);
      file.writeAsStringSync(response.body,flush: true,mode: FileMode.write);
      return res;
    }
    else{
      throw Exception('Failed to retrieve vehicle types checksum');
    }
  }
}