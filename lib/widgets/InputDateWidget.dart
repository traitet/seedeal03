

//==========================================================================
// IMPORT
//==========================================================================
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


//==========================================================================
// SWITCH WIEGET
//==========================================================================  

//==========================================================================
// SELECTOR WIEGET
//==========================================================================  
class InputDateWidget extends StatelessWidget {
  final String title;
  final String text;
  const InputDateWidget({
    this.title,
    this.text,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      height: 40,
      child: Row(children: <Widget>[
        Expanded(child: Text(title??'')),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Text(text??'',style: TextStyle(color: Colors.black)),
        ),
      ],),
    );
  }
}