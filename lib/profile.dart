import 'package:flutter/material.dart';
import 'getUser.dart';

class ProfileData extends StatelessWidget{
  final dynamic user;
  final Function userRequest;

  ProfileData(this.user,this.userRequest);

  Widget build(BuildContext context){
    return FutureBuilder<UserData>(
      future: user,
      builder: (context,snapshot){
        if(snapshot.hasData) {
          return Center(
            child: Column(
              children: [
                SizedBox(height: 20,),
                Text('Full Name:',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(snapshot.data.fName,
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Text(snapshot.data.lName,
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50,),
                Text('Email:',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 20,),
                Text(snapshot.data.email,
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 60,),
                RaisedButton(onPressed: ()=> userRequest('logout',snapshot.data.cookie),
                  color: Colors.blue,
                  textColor: Colors.white,
                  child:Text('Log out'),
                )
              ],
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