//==========================================================================
// IMPORT
//==========================================================================
import 'package:flutter/material.dart';
import 'package:seedeal03/screens/SplashScreenPage.dart';
import './screens/HomePage.dart';
import './screens/LoginPage.dart';
import './screens/SignUpPage.dart';
import './screens/LoginByEmailPage.dart';
import './services/FirebaseAuthenService.dart';
import './screens/DealPostPage.dart';
import './screens/SingleUploadImagePage.dart';
import './screens/SplashScreenPage.dart';
// import './screens/LoginFirebaseEmailPage.dart';
// import './screens/MyResetPasswordPage.dart';
// import '../screens/ProfilePage.dart';
// import './screens/AddTravellerPage.dart';
// import './screens/PersonalDetailPage.dart';
// import './screens/PaymentMethodPage.dart';
// import './screens/ManageBookingPage.dart';
// import './screens/MenuPage.dart';
// import './screens/BookingPage.dart';
// import './screens/ResetPasswordPage.dart';
// import './screens/SampleTabbarPage.dart';
// import './screens/SearchDealFlightHotelPage.dart';
// import './screens/SearchDealHotelPage.dart';
// import './screens/SearchDealTrainPage.dart';
// import './screens/SearchFlightHotelPage.dart';
// import './screens/SearchHotelPage.dart';
// import './screens/TravelBuddiesPage.dart';
// import './screens/HotelDetailPage.dart';
// import './screens/DealListGetPage.dart';

//==========================================================================
// MAIN: RUNAPP
//==========================================================================
void main() {
  runApp(MyApp());
}
//==========================================================================
// MAIN CLASS
//==========================================================================
class MyApp extends StatelessWidget {

//==========================================================================
// BUILD: CONTEXT
//==========================================================================
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//==========================================================================
// SHOW DEBUG
//==========================================================================
      debugShowCheckedModeBanner: false,       
//==========================================================================
// TITLE
//==========================================================================      
      title: 'SeeDel Demo V.0.1',
//==========================================================================
// APP TEAM
//==========================================================================      
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
    ),

      ),
//==========================================================================
// HOME
//==========================================================================      
      home: 
      SplashScreenPage(),
      // MyHomePage(title: 'S E E D E L  0 3 / 12.07.2020 '),
      // routes: <String, WidgetBuilder>{
      // '/LoginPage': (BuildContext context) => LoginPage(),
      // },
    ); 
  }
}
//==========================================================================
// STATE CLASS
//==========================================================================
class MyHomePage extends StatefulWidget {
//==========================================================================
// CONSTUCTURE
//==========================================================================  
  MyHomePage({Key key, this.title}) : super(key: key);
//==========================================================================
// PARAMETER
//==========================================================================
  final String title;
//==========================================================================
// OVERRIDE STATE
//==========================================================================  
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
//==========================================================================
// BUILD
//==========================================================================
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
//==========================================================================
// APP BAR
//==========================================================================      
      appBar: AppBar(
        title: Text(widget.title),
      ),
//==========================================================================
// BODY
//==========================================================================      
      body: Center(
//==========================================================================
// LISTVIEW
//==========================================================================
        child: ListView(
          children: <Widget>[
//==========================================================================
// RAISED BUTTON
//========================================================================== 
            RaisedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()),);}, child: Text('Home Page'),), 
            RaisedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => SplashScreenPage()),);}, child: Text('Splash Screen'),),             
            RaisedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()),);}, child: Text('Login '),),               
            RaisedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => LogInByEmailPage()),);}, child: Text('Sign-in by E-mail'),),   
            RaisedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()),);}, child: Text('Sign Up'),),      
           // RaisedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => LoginBySmsPage()),);}, child: Text('Login by SMS'),),    
            RaisedButton(onPressed: (){signOut(context);}, child: Text('Logout'),),      
            RaisedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => DealPostPage()),);}, child: Text('Post Deal Page'),),                   
            RaisedButton(child: Text('Upload Single Image'),onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => SingleUploadImagePage()));}),                                                 
            // RaisedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()),);}, child: Text('Profile'),),                 
            // RaisedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => MyResetPasswordPage()),);}, child: Text('Reset Password Page - test'),),                
            // RaisedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => DealListGetPage()),);}, child: Text('Get Deal List Page'),),                 
            // RaisedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => DealPostPage()),);}, child: Text('Post Deal Page'),),                 
            // RaisedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ResetPasswordPage()),);}, child: Text('Reset Password'),),     
            // RaisedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => LoginFirebaseEmailPage()),);}, child: Text('Login Firebase '),),               
            // RaisedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => SearchHotelPage()),);}, child: Text('Search Hotel'),),      
            // RaisedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => SearchFlightHotelPage()),);}, child: Text('Search Flight Hotel'),),    
            // RaisedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => TravelBuddiesPage()),);}, child: Text('Travel Budies'),), 
            // RaisedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => AddTravellerPage()),);}, child: Text('Add Traveller'),),    
            // RaisedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => PersonalDetailPage()),);}, child: Text('Personal Detail'),),                
            // RaisedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentMethodPage()),);}, child: Text('Edit Payment Method'),),                                  
            // RaisedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => HotelDetailPage()),);}, child: Text('Hotel Detail'),),                                             
            // RaisedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => SearchDealHotelPage()),);}, child: Text('Search Deal: Hotel'),),                  
            // RaisedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => SearchDealFlightHotelPage()),);}, child: Text('Search Deal: Flight + Hotel'),),                    
            // RaisedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => SearchDealTrainPage()),);}, child: Text('Search Deal: Train'),),               
            // RaisedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => MenuPage()),);}, child: Text('Side Menu'),),  
            // RaisedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => BookingPage()),);}, child: Text('My Booking'),),   
            // RaisedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ManageBookingPage()),);}, child: Text('Manage Booking'),),    
            // RaisedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => SampleTabbarPage()),);}, child: Text('Sample Tab bar Page'),),              
          ],
        ),
      ),
    );
  }



  
}

