import 'package:flutter/material.dart';
import 'vehicleForm.dart';
import 'vehicleFormSetup.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class VehicleInfo extends StatelessWidget{
  final Map<String,dynamic> vehicle;
  final String cookie;

  VehicleInfo(this.vehicle,this.cookie);

  Future<void> _deleteCacheContents() async {
    final cacheDir = await getTemporaryDirectory();
    String fileName = 'CacheTypesChecksum.json';
    if (await File(cacheDir.path + '/' + fileName).exists()) {
      cacheDir.delete(recursive: true);
      print('All cache deleted!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Vehicle: ${vehicle['regNum']}'),
      ),
        floatingActionButton: FloatingActionButton(
          onPressed: _deleteCacheContents,
          tooltip: 'Delete the Cache file',
          child: Icon(Icons.delete),
        ),
      body: Column(
        children: [
          Container(
            width:double.infinity,
            height:80,
            margin:EdgeInsets.only(
              top:30,
            ),
            color: Colors.blue,
            child:Column(
                children: [
                  SizedBox(height:10,),
                  Row(
                    children:[
                      Text('Reg Number: ${vehicle['regNum']}',
                        style:TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                        )
                      ),
                      SizedBox(width: 60,),
                      Text('Vehicle km:',
                          style:TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          )
                      )
                    ],
                ),
                  SizedBox(height:10,),
                  Row(
                      children:[
                        Text('${vehicle['vehicleBrand']['name']} ${vehicle['vehicleModel']['name']}',
                            style:TextStyle(
                              fontSize: 19,
                              color: Colors.white,
                            )
                        ),
                        SizedBox(width: 200,),
                        Text('${vehicle['km']}',
                            style:TextStyle(
                              fontSize: 17,
                              color: Colors.white,
                            )
                        )
                      ]
                  )
              ]
            ),
          ),
          Container(
            width: double.infinity,
            height: 250,
            margin:EdgeInsets.only(
              bottom: 20,
            ),
            child: Container(
              height:250,
              child: Image.network('https://gara6.bg/auto-api/imgs/thmb/${vehicle['primaryImgHash']}',
                width: 250,
                height:250,
                headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
                  'cookie':cookie,
                },
              ),
            ),
          ),
          RaisedButton.icon(icon: Icon(Icons.edit),label: Text('Edit'),color: Colors.blue,
            onPressed: (){
              List<dynamic> vehicleData = vehicleFormSetup(cookie);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => VehicleForm(vehicle['id'],vehicle['vehicleAttributes'],vehicleData[0],vehicleData[1],vehicleData[2]),),
              );
            },
          )
        ],
      )
    );
  }
}