import 'package:flutter/material.dart';
import 'loggedInFiles/home.dart';
import 'login.dart';

class MyForm extends StatelessWidget{
  final TextEditingController _emailCont=TextEditingController();
  final TextEditingController _passCont=TextEditingController();

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Form'),
      ),
      body:Center(
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                  hintText: 'Enter your email'
              ),
              controller: _emailCont,
            ),
            TextFormField(
              decoration: const InputDecoration(
                  hintText: 'Enter your password'
              ),
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              controller: _passCont,
            ),
            RaisedButton(
              onPressed: () {
                Future<ResponseData> data = createRequest(_emailCont.text, _passCont.text);
                _emailCont.clear();
                _passCont.clear();
                FocusScope.of(context).unfocus();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen(data)),);
                },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text('Login'),
            ),
          ],
        ),
      )
    );
  }
}