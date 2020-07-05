//==========================================================================
// IMPORT
//==========================================================================
import 'package:flutter/material.dart';

//==========================================================================
// MAIN CLASS
//==========================================================================
class TabNotFoundWidget extends StatelessWidget {
//==========================================================================
// CONSTUCTURE
//==========================================================================  
  const TabNotFoundWidget({
    Key key,
  }) : super(key: key);
//==========================================================================
// OVERRIDE BUILD WIDGET
//==========================================================================
  @override
  Widget build(BuildContext context) {
    return 
//==========================================================================
// RETURN
//==========================================================================    
    SafeArea(
         child: Container(
           alignment: Alignment.center,
           color: Colors.black87,
           child: Text('Under Construction', style: TextStyle(fontSize: 30, color: Colors.white),)),
    );
  }
}
