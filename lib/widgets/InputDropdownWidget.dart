
//==========================================================================
// IMPORT
//==========================================================================
import 'package:flutter/material.dart';


//==========================================================================
// LINE WIDGET
//========================================================================== 
class InputDropdownWidget extends StatelessWidget {
  final String title;
  final String text;
  const InputDropdownWidget({
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
        Text(text??'',style: TextStyle(color: Colors.grey)),
        Icon(Icons.navigate_next,color: Colors.black12,),
      ],),
    );
  }
}
