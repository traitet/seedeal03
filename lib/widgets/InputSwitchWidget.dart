

//==========================================================================
// IMPORT
//==========================================================================
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


//==========================================================================
// SWITCH WIEGET
//==========================================================================  

class InputSwitchWidget extends StatefulWidget {
 final String title;
  final bool isSelect;
  const InputSwitchWidget({
    this.title,
    this.isSelect,
    Key key,
  }) : super(key: key);  
  @override
  _SwitchWidgetState createState() => _SwitchWidgetState();
}
class _SwitchWidgetState extends State<InputSwitchWidget> {
bool isSelect;
  @override
  void initState() {
      isSelect = widget.isSelect;
      super.initState();
    }
  @override
  Widget build(BuildContext context) {
    return 
      Container(child: MergeSemantics(child: ListTile(title: Text(widget.title),trailing: CupertinoSwitch(value: isSelect,onChanged: (bool value) { setState(() { isSelect = value; }); },),onTap: () { setState(() { isSelect = !isSelect; }); },)));
  }
}


