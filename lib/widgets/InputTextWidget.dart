

//==========================================================================
// IMPORT
//==========================================================================
import 'package:flutter/material.dart';
// import 'package:flutter_masked_text/flutter_masked_text.dart';


//==========================================================================
// SELECTOR WIEGET
//==========================================================================  
class InputTextWidget extends StatelessWidget {
//==========================================================================
// PROPERTY
//==========================================================================       
  final String title;
  final double price;
  final TextEditingController controller;
//==========================================================================
// CONSTRUCTURE
//==========================================================================     
  const InputTextWidget({
    this.title,
    this.price,
    this.controller,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      height: 40,
      child: Row(children: <Widget>[
//==========================================================================
// TITILE
//==========================================================================          
        Expanded(child: Text(title??'')),
//==========================================================================
// INPUT
//==========================================================================          
        Container(
          width: 200,
          // color: Colors.grey,
          child: Padding(
            padding: EdgeInsets.only(right: 10),
            child: TextFormField(
              textAlign: TextAlign.right,
              controller: controller, 
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: null,
                filled: true,
                //hintStyle: TextStyle(color: Colors.grey[800]),
                hintText: '0.00',
                // fillColor: Colors.black12
                ),
              style: TextStyle(color: Colors.black)),
          ),
        ),
      ],),
    );
  }
}