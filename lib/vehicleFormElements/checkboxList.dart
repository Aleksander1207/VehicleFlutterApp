import 'package:flutter/material.dart';

class CheckboxList extends StatelessWidget{
  final bool checkbox;
  final String text;
  final Function onChanged;

  CheckboxList(this.checkbox,this.text,this.onChanged);

  void handleChange(){
   onChanged(!checkbox);
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      title:Text(text,style: TextStyle(color: Colors.blue,fontSize: 18),),
      value:checkbox,
      onChanged:onChanged,
    );
  }
}