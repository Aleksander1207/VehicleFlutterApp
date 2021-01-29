import 'package:flutter/material.dart';
import 'package:test_flutter_app/login.dart';
import 'drawer.dart';

class HomeScreen extends StatelessWidget{
  final Function userRequest;
  final Future<ResponseData> data;

  HomeScreen(this.data,this.userRequest);

  @override
  Widget build(BuildContext context){
    return FutureBuilder<ResponseData>(
        future: data,
        builder: (context, snapshot){
          if(snapshot.hasData){
            return Scaffold(
              appBar: AppBar(
                title: Text('Logged in'),
              ),
              drawer: MyDrawer(userRequest,snapshot.data.email,snapshot.data.cookie),
              body: Container(
                child:Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Welcome!',
                      style: TextStyle(
                        fontSize: 38,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
                ),
              ),
            );
          }
          else if(snapshot.hasError){
            return Text('${snapshot.error}');
          }
          return CircularProgressIndicator();
        }
    );
  }
}