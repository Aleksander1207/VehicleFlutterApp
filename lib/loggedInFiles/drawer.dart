import 'package:flutter/material.dart';
import '../getVehicles.dart';
import '../vehicles.dart';
import '../getUser.dart';
import 'profile.dart';
import './drawerHeader.dart';
import './home.dart';
import '../listTile.dart';
import '../login.dart';
import '../logout.dart';


class MyDrawer extends StatelessWidget{
  final String email;
  final String cookie;
  final Future<ResponseData> data;

  MyDrawer(this.email,this.cookie,this.data);

  Widget build(BuildContext context){
    return Drawer(
          child: Column(
            children: [
              MyHeader(email),
              MyTile(Icons.home,'Home Page',(){
                Navigator.of(context).pop();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => HomeScreen(data),
                    ),
                    ModalRoute.withName('/'));
              }),
              MyTile(Icons.person, 'Profile', (){
                Future<UserData> user = getUser(cookie);
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileData(user,cookie,email,data)),);
              }),
              MyTile(Icons.directions_car,'Vehicles',(){
                    Future<Vehicles> vehicles = getVehicles(cookie);
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => VehiclesList(vehicles,cookie,email,data)),
                    );
                  }
              ),
              MyTile(Icons.arrow_back, 'Exit', (){
                Future<int> exit=logOut(cookie);
                if(exit!=null){
                  Navigator.popUntil(context, (Route<dynamic> predicate) => predicate.isFirst);
                }
              }
              ),
            ],
          ),
    );
  }
}