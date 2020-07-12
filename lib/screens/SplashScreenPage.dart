
//==========================================================================
// IMPORT
//==========================================================================
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import '../main.dart';

//==========================================================================
// MAIN CLASS
//==========================================================================
class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => new _SplashScreenPageState();
}


//==========================================================================
// STATE CLASS
//==========================================================================
class _SplashScreenPageState extends State<SplashScreenPage> {

//==========================================================================
// BUILD WIDGET
//==========================================================================
  @override
  Widget build(BuildContext context) {
    return SplashScreen(

//==========================================================================
// NO OF SECOND
//==========================================================================      
      seconds: 5,
      navigateAfterSeconds: new MyHomePage(title: 'Seedel 2020'),
      title: Text('Welcome to the Seedel 2020',style: new TextStyle(fontWeight: FontWeight.normal,fontSize: 15.0,color: Colors.white),),
      image: Image.asset('assets/images/seedellogo.png'),
      //backgroundGradient: new LinearGradient(colors: [Colors.cyan, Colors.blue], begin: Alignment.topLeft, end: Alignment.bottomRight),
      backgroundColor: Colors.deepOrange,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100.0,
      onClick: ()=>print("SEEDEL, Est 2020"),
      loaderColor: Colors.white,
    );
  }
}

