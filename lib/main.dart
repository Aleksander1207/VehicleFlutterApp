import 'package:flutter/material.dart';
import './home.dart';
import './profile.dart';
import 'getUser.dart';
import 'login.dart';
import 'logout.dart';
import 'myForm.dart';


void main()=>runApp(LoginForm());

class LoginForm extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _LoginFormState();
  }
}

class _LoginFormState extends State <LoginForm>{
  final TextEditingController _emailCont=TextEditingController();
  final TextEditingController _passCont=TextEditingController();
  Future<ResponseData> _data;
  Future<UserData> _user;
  Future<int> _out;

  void _userRequest(userRequest,cookie)
  {
    if(userRequest=="get") {
      setState(() {
       _user = getUser(cookie);
      }
      );
    }
    else{
      setState(() {
        _out= logOut(cookie);
        if(_out!=null){
          _data=null;
          _user=null;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
        home: (_data!=null && _user==null) ? HomeScreen(_data,_userRequest):
       Scaffold(
          appBar: AppBar(
            title: Text('Login Form'),
          ),
        body:Center(
          child: Column(
            children:
            <Widget> [
              if(_data==null)...[
                MyForm(_emailCont,_passCont),
                  RaisedButton(
                    onPressed: () {
                      setState(() {
                        _data = createRequest(_emailCont.text, _passCont.text);
                        _emailCont.clear();
                        _passCont.clear();
                      });
                    },
                    textColor: Colors.white,
                    color: Colors.blue,
                    child: Text('Login'),
                  ),]
                else if(_user!=null)...[
                  ProfileData(_user,_userRequest),
              ],
             ],
            ),
          ),
        )
    );
  }

}