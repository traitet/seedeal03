//==========================================================================
// IMPORT MATERIAL
//==========================================================================
import 'package:flutter/material.dart';

//==========================================================================
// MAIN CLASS
//==========================================================================
class DropdownBarWidget extends StatefulWidget {
//==========================================================================
// CONSTRUCTURE
//==========================================================================
  final VoidCallback onPressed;
  final String hintText;
  final IconData hintIcon;
  final TextStyle textStyle;
  final double borderRadius;
  final double fontSize;
  final Color dropdownColor;
//==========================================================================
// GET/SET
//==========================================================================
  DropdownBarWidget({
    this.onPressed,
    this.borderRadius = 0,
    this.hintText = 'Sign in',
    this.hintIcon = Icons.tram,
    this.textStyle,
    this.dropdownColor = Colors.white,
    this.fontSize,
    Key key,
  })  : assert(hintText != null),
        super(key: key);
  @override
  _DropdownBarWidgetState createState() => _DropdownBarWidgetState();
}

//==========================================================================
// STATECLASS
//==========================================================================
class _DropdownBarWidgetState extends State<DropdownBarWidget> {
  @override
  Widget build(BuildContext context) {
//==========================================================================
// DECLARE VARIABLE
//==========================================================================
    // final textStyle1 = TextStyle(color: Colors.white);
//==========================================================================
// RETURN WIDGET
//==========================================================================
    return Padding(
      padding: const EdgeInsets.only(top: 4,bottom: 4),
      child: Container(
//==========================================================================
// BORDER
//==========================================================================
        decoration: ShapeDecoration(
            color: widget.dropdownColor,
            shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, style: BorderStyle.solid),
                borderRadius:
                    BorderRadius.all(Radius.circular(widget.borderRadius)))),
//==========================================================================
// DROPDOWN BUTTON
//==========================================================================
        child: DropdownButton(
            underline: Container(),
            icon: Icon(Icons.expand_more),
//==========================================================================
// DROPDOWN ITEMS (DATA)
//==========================================================================
            items: [
              DropdownMenuItem(child: Text('4 adults, 1 room'), value: '2'),
              DropdownMenuItem(child: Text('4 adults, 2 rooms'), value: '3'),
            ],
            dropdownColor: Colors.white,
            isExpanded: true,
//==========================================================================
// HINT
//==========================================================================
            hint: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(widget.hintIcon),
                SizedBox(width: 10),
                Text(widget.hintText)
              ],
            ),
            onChanged: (value) {}),
      ),
    );
  }
}
