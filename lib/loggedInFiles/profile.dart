import 'package:flutter/material.dart';
import 'drawer.dart';
import '../getUser.dart';
import '../login.dart';

class ProfileData extends StatelessWidget{
  final Future<UserData> user;
  final String cookie;
  final String email;
  final Future<ResponseData> data;

  ProfileData(this.user,this.cookie,this.email,this.data);

  Widget build(BuildContext context){
    return FutureBuilder<UserData>(
      future: user,
      builder: (context,snapshot){
        if(snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Profile'),
            ),
            drawer: MyDrawer(email,cookie,data),
            body: Container(
              child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${snapshot.data.fName} ${snapshot.data.lName}',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text('${snapshot.data.email}',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
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