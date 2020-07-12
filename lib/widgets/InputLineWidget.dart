
//==========================================================================
// IMPORT
//==========================================================================
import 'package:flutter/material.dart';


//==========================================================================
// LINE WIDGET
//========================================================================== 
class InputLineWidget extends StatelessWidget {
  const InputLineWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Container(color: Colors.grey[400],child: SizedBox(height: 0.5)),
    );
  }
}
