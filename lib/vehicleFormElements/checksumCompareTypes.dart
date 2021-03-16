import '../getTypesChecksum.dart';
import 'package:flutter/material.dart';

bool compareTypesChecksum(Future<TypesChecksum> checksumAPI,Future<TypesChecksum> checksumCache){
  String apiChecksum;
  String cacheChecksum;
  FutureBuilder<TypesChecksum>(
      future: checksumAPI,
      builder: (context,snapshot){
        if(snapshot.hasData){
          apiChecksum=snapshot.data.data;
        }
        else if(snapshot.hasError){
          print(snapshot.error);
        }
        else{
          print("Waiting for the API brands checksum");
        }
      }
  );
  FutureBuilder<TypesChecksum>(
      future: checksumCache,
      builder: (context,snapshot){
        if(snapshot.hasData){
          cacheChecksum=snapshot.data.data;
        }
        else if(snapshot.hasError){
          print(snapshot.error);
        }
        else{
          print("Waiting for the cache brands checksum");
        }
      }
  );

  return(apiChecksum==cacheChecksum);
}