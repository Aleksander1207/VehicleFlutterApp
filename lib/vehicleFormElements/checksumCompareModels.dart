import '../getModelsChecksum.dart';
import 'package:flutter/material.dart';

bool compareModelsChecksum(Future<ModelsChecksum> checksumAPI,Future<ModelsChecksum> checksumCache){
  String apiChecksum;
  String cacheChecksum;
  FutureBuilder<ModelsChecksum>(
      future: checksumAPI,
      builder: (context,snapshot){
        if(snapshot.hasData){
          apiChecksum=snapshot.data.data;
        }
        else if(snapshot.hasError){
          print(snapshot.error);
        }
        else{
          print("Waiting for the API models checksum");
        }
      }
  );
  FutureBuilder<ModelsChecksum>(
      future: checksumCache,
      builder: (context,snapshot){
        if(snapshot.hasData){
          cacheChecksum=snapshot.data.data;
        }
        else if(snapshot.hasError){
          print(snapshot.error);
        }
        else{
          print("Waiting for the cache models checksum");
        }
      }
  );
  return(apiChecksum==cacheChecksum);
}