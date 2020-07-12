//==========================================================================
// IMPORT
//==========================================================================
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../singletons/GlobalAppData.dart';
import '../widgets/TextFieldWidget.dart';
import '../models/DBUserModel.dart';
import '../widgets/LoadingWidget.dart';


//==========================================================================
// MAIN CLASS
//==========================================================================
class TabPostDeliveryWidget extends StatefulWidget {
    const TabPostDeliveryWidget({
    Key key,
  }) : super(key: key);
  @override
  _TabPostDeliveryWidgetState createState() => _TabPostDeliveryWidgetState();
}

//==========================================================================
// STATE CLASS
//==========================================================================
class _TabPostDeliveryWidgetState extends State<TabPostDeliveryWidget> { 
//==========================================================================
// DECLARE VARIABLE
//==========================================================================  
  TextEditingController deliveryDescriptionController = TextEditingController();


  //========================================================================================
  // OVERRIDE BUILD WIDGET
  //========================================================================================
  @override
  Widget build(BuildContext context) {
    const padding = 15.0;
    const paddingTop = 5.0;
    // FlutterStatusbarcolor.setStatusBarColor(Theme.of(context).primaryColor);
    return  Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                SizedBox(height: paddingTop),
//==========================================================================
// TEXT: WELCOME
//==========================================================================
                Padding(padding: const EdgeInsets.all(8.0),child: Text('วิธีจัดส่งสินค้า',style:TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),),
                Padding(padding: const EdgeInsets.only(left:8,top: 4, bottom:4),child: CupertinoTextField(maxLines: 5,placeholder: 'Note',controller: deliveryDescriptionController,clearButtonMode: OverlayVisibilityMode.editing,),), 
                SizedBox(height: padding),
              ],
            ),
          ),
        
    );
  }
}
