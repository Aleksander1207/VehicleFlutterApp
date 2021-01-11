// import 'dart:convert';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginForm(),
    );
  }
}

class LoginForm extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login(context) async {
    var data = await http.post(
      "https://omg.gara6.bg/pm-api/users/login",
        headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': emailController.text,
        'password': passwordController.text
      }),
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(child: Text(jsonDecode(data.body)['statusCode']));
      }
    );
    print(jsonDecode(data.body)['statusCode']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test Login App"),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            TextField(
              obscureText: false,
              controller: emailController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: "Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32.0)
                )
              ),
            ),
            TextField(
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32.0)
                )
              ),
            ),
            RaisedButton(
              onPressed: () {
                login(context);
              },
              child: Text("login"),
            )
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login() async {
    var data = await http.post(
      "https://omg.gara6.bg/pm-api/users/login",
        headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': emailController.text,
        'password': passwordController.text
      }),
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(child: Text(jsonDecode(data.body)['statusCode']));
      }
    );
    print(jsonDecode(data.body)['statusCode']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            TextField(
              obscureText: false,
              style: style,
              controller: emailController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: "Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32.0)
                )
              ),
            ),
            TextField(
              obscureText: true,
              style: style,
              controller: passwordController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                hintText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32.0)
                )
              ),
            ),
            RaisedButton(
              onPressed: () {
                login();
              },
              child: Text("login"),
            )
          ],
        ),
      )
    );
  }
}
