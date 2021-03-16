import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class BrandsChecksum {
  final String data;

  BrandsChecksum({this.data});

  factory BrandsChecksum.fromJson(Map<String,dynamic> json){
    return BrandsChecksum(
      data:json['data'],
    );
  }
}

Future<BrandsChecksum> getBrandsChecksumAPI(String cookie)async{
  String fileName='CacheBrandsChecksum.json';
  print('Loading brands checksum from API function');
    final http.Response response = await http.get(
      'https://gara6.bg/auto-api/vehicleBrands/checksum',
      headers: <String, String>{
        'Content-Type': 'application/json',
        'cookie':cookie,
      },
    );

    if(response.statusCode==200){
      BrandsChecksum res = BrandsChecksum.fromJson(jsonDecode(response.body));

      var tempDir = await getTemporaryDirectory();
      File file = new File(tempDir.path + '/' + fileName);
      file.writeAsStringSync(response.body,flush: true,mode: FileMode.write);
      return res;
    }
    else{
      throw Exception('Failed to retrieve vehicle brands checksum');
    }
}

Future<BrandsChecksum> getBrandsCheckSumCache(String cookie)async{
  String fileName='CacheBrandsChecksum.json';
  var cacheDir= await getTemporaryDirectory();
  if(await File(cacheDir.path + '/' + fileName).exists()){
    print('Loading brands checksum from cache');
    var jsonData=File(cacheDir.path + '/' + fileName).readAsStringSync();
    BrandsChecksum checksum = BrandsChecksum.fromJson(jsonDecode(jsonData));
    return checksum;
  }
  else{
    print('Loading brands checksum from API cache function');
    final http.Response response = await http.get(
      'https://gara6.bg/auto-api/vehicleBrands/checksum',
      headers: <String, String>{
        'Content-Type': 'application/json',
        'cookie':cookie,
      },
    );
    if(response.statusCode==200){
      BrandsChecksum res = BrandsChecksum.fromJson(jsonDecode(response.body));

      var tempDir = await getTemporaryDirectory();
      File file = new File(tempDir.path + '/' + fileName);
      file.writeAsStringSync(response.body,flush: true,mode: FileMode.write);
      return res;
    }
    else{
      throw Exception('Failed to retrieve vehicle brands checksum');
    }
  }
}