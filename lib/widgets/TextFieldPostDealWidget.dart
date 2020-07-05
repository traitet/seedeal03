//==========================================================================
// IMPORT MATERIAL
//==========================================================================
import 'dart:ui';

import 'package:flutter/material.dart';

//==========================================================================
// MAIN CLASS
//==========================================================================
class TextFieldPostDealWidget extends StatelessWidget {
//==========================================================================
// CONSTRUCTURE
//==========================================================================
  final String text;
  final IconData icon;
  final TextInputType textInputType;
  final TextEditingController controller;
  final bool obscureText; 

//==========================================================================
// GET/SET
//==========================================================================
  TextFieldPostDealWidget({
    this.text = 'Name',
    this.icon,
    this.textInputType = TextInputType.text,
    this.obscureText = false,
    this.controller,
    Key key,
  })  : assert(text != null),
        super(key: key);

//==========================================================================
// OVERRIDE: BUILD
//==========================================================================
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4,bottom: 4),
      child: TextFormField(
        style: TextStyle(fontSize: 12),
        obscureText: obscureText,
        keyboardType: textInputType,
        minLines: 1,
        maxLines: 3,
        decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 12),
            border: OutlineInputBorder(borderRadius: const BorderRadius.all(Radius.circular(0),),),
            filled: true,
            hintStyle: TextStyle(color: Colors.grey[800]),
            hintText: text,
            prefixIcon: Icon(icon ?? Icons.email),
            fillColor: Colors.white70),
        controller: controller,
      ),
    );
  }
}
