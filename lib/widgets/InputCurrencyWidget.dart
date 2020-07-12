

//==========================================================================
// IMPORT
//==========================================================================
import 'package:flutter/material.dart';


//==========================================================================
// SELECTOR WIEGET
//==========================================================================  
class InputCurrencyWidget extends StatelessWidget {
  final String title;
  final String text;
  const InputCurrencyWidget({
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