import 'package:flutter/material.dart';
import 'login.dart';

class UserPage extends StatelessWidget{
  final dynamic data;
  final Function userRequest;

  UserPage(this.data, this.userRequest);

 @override
  Widget build(BuildContext context){
    return FutureBuilder<ResponseData>(
        future: data,
        builder: (context,snapshot){
      if(snapshot.hasData){
        return Center(
          child:Column(
            children: [
              SizedBox(height:40,),
              Text('${snapshot.data.email}',
                style:TextStyle(
                  fontSize: 18,
                  color: Colors.blue,
                )
              ),
              SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(onPressed: ()=> userRequest('get',snapshot.data.cookie),
                    color: Colors.blue,
                    textColor: Colors.white,
                    child:Text('View Profile'),
                  ),
                  SizedBox(width: 100,),
                  RaisedButton(onPressed: ()=> userRequest('logout',snapshot.data.cookie),
                    color: Colors.blue,
                    textColor: Colors.white,
                    child:Text('Log out'),
                  )
                ],
              )
            ],
          )
        );
      }
      else if(snapshot.hasError) {
        return Text('${snapshot.error}');
      }
      return CircularProgressIndicator();
    }
    );
  }
}