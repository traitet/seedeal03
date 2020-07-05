
//==========================================================================
// IMPORT MATERIAL
//==========================================================================
import 'package:flutter/material.dart';

//==========================================================================
// MAIN CLASS
//==========================================================================
class ButtonBarWidget extends StatelessWidget {

//==========================================================================
// CONSTRUCTURE
//==========================================================================  
  final String text;
  final TextStyle textStyle;
  final VoidCallback onPressed;
  final double borderRadius;
  final Color splashColor;
  final double height;
  final double fontSize;
  final Colors color;
//==========================================================================
// GET/SET
//==========================================================================
  ButtonBarWidget({
    this.onPressed,
    this.borderRadius,
    this.text = 'Sign in',
    this.textStyle,
    this.splashColor,
    this.height,
    this.color,
    this.fontSize,
    Key key,
  })  : assert(text != null),
        super(key: key);

//==========================================================================
// OVERRIDE: BUILD
//==========================================================================
  @override
  Widget build(BuildContext context) {
      
    return Container(
      height: height??40,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 3),
        ),
        color: color??Theme.of(context).primaryColor,
        splashColor: splashColor,
        child: Text(text,
            style: textStyle ??
                TextStyle(
                    fontSize: fontSize??18,
                    fontWeight: FontWeight.normal,
                    color: Colors.white)),
        onPressed: onPressed,
      ),
    );
  }
}
