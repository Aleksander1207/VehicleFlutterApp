import '../getBrandsChecksum.dart';
import 'package:flutter/material.dart';

bool compareBrandsChecksum(Future<BrandsChecksum> checksumAPI,Future<BrandsChecksum> checksumCache){
  String apiChecksum;
  String cacheChecksum;
  FutureBuilder<BrandsChecksum>(
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
  FutureBuilder<BrandsChecksum>(
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