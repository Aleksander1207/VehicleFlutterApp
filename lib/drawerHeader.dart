import 'package:flutter/material.dart';

class MyHeader extends StatelessWidget{
  final String email;

  MyHeader(this.email);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}