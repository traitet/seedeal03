//==========================================================================
// IMPORT MATERIAL
//==========================================================================
import 'package:flutter/material.dart';

//==========================================================================
// MAIN CLASS
//==========================================================================
class TextFieldWidget extends StatelessWidget {
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
  TextFieldWidget({
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
   const double textFieldPadding = 4;     
    return Padding(
      padding: const EdgeInsets.all(textFieldPadding),
      child: TextFormField(
        obscureText: obscureText,
        keyboardType: textInputType,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: const BorderRadius.all(
                const Radius.circular(5),
              ),
            ),
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
