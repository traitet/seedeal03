//==========================================================================
// IMPORT
//==========================================================================
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import '../widgets/LVVertSearchHotelWidget.dart';
import '../screens/HotelDetailPage.dart';

//==========================================================================
// MAIN CLASS
//==========================================================================
class TabSearchWidget extends StatefulWidget {
  @override
  _TabSearchWidgetState createState() => _TabSearchWidgetState();
}

//==========================================================================
// STATE CLASS
//==========================================================================
class _TabSearchWidgetState extends State<TabSearchWidget> {
  @override
  Widget build(BuildContext context) {
    // const padding = 15.0;

    FlutterStatusbarcolor.setStatusBarColor(Theme.of(context).primaryColor);
    return MaterialApp(
//==========================================================================
// SHOW DEBUG
//==========================================================================
        debugShowCheckedModeBanner: false,
//==========================================================================
// THEME
//==========================================================================
        theme: ThemeData(primarySwatch: Theme.of(context).primaryColor,),
//==========================================================================
// HOME
//==========================================================================
        home: Scaffold(
//==========================================================================
// SCAFFOLD / TITLE + BACK
//========================================================================== 
                   appBar: AppBar(
                      iconTheme: IconThemeData(color: Colors.black),
                      //leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.white,),onPressed: () => Navigator.of(context).pop()),
                      centerTitle: true,
                      title: Text('Search Hotel'),
            ),
//==========================================================================
// BODY
//==========================================================================
            body: SafeArea(
              child: Column(
                children: <Widget>[   
//==========================================================================
// HEADER BAR# HEADER
//==========================================================================
                Container(
                  padding: EdgeInsets.only(top: 8, bottom: 8),
                  decoration: BoxDecoration(color: Colors.black87),    
                  alignment: Alignment.center,
                  child: Text('Manchester to London', style: TextStyle(color: Colors.white,fontSize: 18),),
                ) ,
//==========================================================================
// HEADER BAR# LINE2
//==========================================================================              
                Container(
                    decoration: BoxDecoration(color: Colors.black87), 
                    padding: EdgeInsets.only(bottom: 8),                               
                    child: Row(children: <Widget>[
                    Text('30 May - 31 May', style: TextStyle(color: Colors.white, fontSize: 12),),
                    Text(' | ', style: TextStyle(color: Colors.white),),
                    Icon(Icons.person,color: Colors.white, size:18),
                    Text(' 2', style: TextStyle(color: Colors.white, fontSize: 12),),
                    Text(' | ', style: TextStyle(color: Colors.white, fontSize: 12),),
                    Icon(Icons.hotel,color: Colors.white, size:18),
                    Expanded(child: Text(' 2', style: TextStyle(color: Colors.white, fontSize: 12),)),     
                    Text('Modify', style: TextStyle(color: Colors.white, fontSize: 12),),  
                    Icon(Icons.edit,color: Colors.white, size:18),  
                  ],),
                ) , 
//==========================================================================
// LISTVIEW & CARD
//==========================================================================
                  Expanded(child: Container(
                    child: LVVertSearchHotelWidget(
                      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => HotelDetailPage()),);},
                    ),
                  ))

//==========================================================================
// WIDGET
//==========================================================================
              ],
              ),
            )));
  }
}


