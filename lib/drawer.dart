import 'package:flutter/material.dart';
import 'package:test_flutter_app/getVehicles.dart';
import './vehicles.dart';

class MyDrawer extends StatelessWidget{
  final Function userRequest;
  final String email;
  final String cookie;

  MyDrawer(this.userRequest,this.email,this.cookie);

  Widget build(BuildContext context){
    return Drawer(
          child: Column(
            children: [
              Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              color: Colors.blue,
                child:Center(
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: 100,
                        height: 100,
                        margin:EdgeInsets.only(
                            top:30,
                          bottom: 20,
                        ),
                        decoration: BoxDecoration(
                          shape:BoxShape.circle,
                          image:DecorationImage(
                            image:NetworkImage('https://www.bsn.eu/wp-content/uploads/2016/12/user-icon-image-placeholder.jpg'),
                            fit:BoxFit.fill,
                          ),
                        ),
                      ),
                      Text(email,
                        style:TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      )
                    ],
                  )
                ),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Profile',
                style:TextStyle(
                  fontSize: 18,
                 ),
                ),
                onTap: (){
                  userRequest('get',cookie);
                  Navigator.pop(context);
                },

              ),
              ListTile(
                leading: Icon(Icons.directions_car),
                title: Text('Vehicles',
                  style:TextStyle(
                    fontSize: 18,
                  ),
                ),
                onTap: (){
                  Future<Vehicles> vehicles=getVehicles(cookie);
                  print(vehicles);
                  print(Navigator.defaultRouteName);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => VehiclesList()),
                  );
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.arrow_back),
                title: Text('Exit',
                  style:TextStyle(
                    fontSize: 18,
                  ),
                ),
                onTap: (){
                  userRequest('logout',cookie);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
    );
  }
}