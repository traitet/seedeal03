//==========================================================================
// IMPORT
//==========================================================================
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widgets/TabPostDealWidget.dart';
// import '../widgets/TabHomeWidget.dart';
import '../widgets/TabMoreWidget.dart';
// import '../widgets/TabMyProfileWidget.dart';
import '../widgets/TabNotFoundWidget.dart';
// import '../widgets/TabSearchDealWidget.dart';
import '../widgets/TabSearchWidget.dart';



//==========================================================================
// MAIN CLASS
//==========================================================================
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

//==========================================================================
// STATE CLASS
//==========================================================================
class _HomePageState extends State<HomePage> {
//==========================================================================
// DECLARE VARIABLE
//==========================================================================  
  int _tabIndex = 0;
//==========================================================================
// OVERRIDE BUILD WIDGET
//==========================================================================  
  @override
  Widget build(BuildContext context) {
//==========================================================================
// STATUS BAR COLOR (IMPORT FLUTTER/SERVICE)
//==========================================================================   
   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor:  Theme.of(context).primaryColor,));
    // const padding = 15.0;   
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
            // appBar: AppBar(title: Text(globalAppData.userName),),
//==========================================================================
// BUTTOM NAVIGATION BAR
// www.willowtreeapps.com/ideas/how-to-use-flutter-to-build-an-app-with-bottom-navigation
//==========================================================================
            bottomNavigationBar: BottomNavigationBar(
//==========================================================================
// ONTAB -> SETSTATE
//==========================================================================              
              onTap: (int index){setState(() {_tabIndex = index;});},
//==========================================================================
//BOTTM NAVIGATIONBAR
//==========================================================================                  
              type: BottomNavigationBarType.fixed,
              currentIndex: _tabIndex,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('หน้าแรก') ),
                BottomNavigationBarItem(icon: Icon(Icons.assignment_ind),title: Text('ดีลเด่น'),),                
                BottomNavigationBarItem(icon: Icon(Icons.search),title: Text('ค้นหาดีล'),),
                BottomNavigationBarItem(icon: Icon(Icons.insert_comment), title: Text('โพสต์ดีล')),                      
                // BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('ประวัติ')),
                BottomNavigationBarItem(icon: Icon(Icons.more_horiz), title: Text('อื่น ๆ')),
              ],
            ),
//==========================================================================
// BODY
//==========================================================================
            body:
            //         _tabIndex == 0 ? TabHomeWidget():
            //         _tabIndex == 1 ? TabSearchDealWidget():
                       _tabIndex == 2 ? TabSearchWidget():
                     _tabIndex == 3 ? TabPostDealWidget():             
            //         _tabIndex == 4 ? TabMyProfileWidget():                                  
                       _tabIndex == 4 ? TabMoreWidget(): 
                      TabNotFoundWidget()                 
//==========================================================================
// END: SCAFFOLD & MATERIAL APP
//==========================================================================            
    ));
//==========================================================================
// END: OVERRIDE & CLASS
//==========================================================================
  }}

