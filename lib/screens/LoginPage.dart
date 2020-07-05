//==========================================================================
// IMPORT
//==========================================================================
import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import '../screens/HomePage.dart';
import '../singletons/GlobalAppData.dart';
import '../services/ShowNotiService.dart';
import '../models/TextStyleModel.dart';
import '../screens/SignInByEmailPage.dart';
import '../screens/SignUpPage.dart';
import '../services/FirebaseAuthenService.dart';
import '../widgets/ButtonBarWidget.dart';

//==========================================================================
// MAIN CLASS
//==========================================================================
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

//==========================================================================
// STATE CLASS
//==========================================================================
class _LoginPageState extends State<LoginPage> {
//==========================================================================
// GLOBAL KEY ******
//==========================================================================  
   GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    const padding = 15.0;
    FlutterStatusbarcolor.setStatusBarColor(Theme.of(context).primaryColor);
    return MaterialApp(
//==========================================================================
// SHOW DEBUG
//==========================================================================      
      debugShowCheckedModeBanner: false,      
//==========================================================================
// THEME
//==========================================================================
      theme: ThemeData(
        primarySwatch: Theme.of(context).primaryColor,

          ),
//==========================================================================
// HOME
//==========================================================================
      home: Scaffold(
        // appBar: AppBar(
        //   title: Text('Login'),
        // ),
//==========================================================================
// BODY
//==========================================================================
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: <Widget>[
      
//==========================================================================
// TEXT: WELCOME
//==========================================================================
Image(image: AssetImage('assets/images/welcome.JPG')),

//==========================================================================
// TEXT: JOIN US
//==========================================================================                
                Center(child: Text('Join us now to discover our hot deals!',style: TextStyleModel().textStyleM)),
                SizedBox(height: padding),                        
//==========================================================================
// TEXT: LOGIN
//==========================================================================                        
                Center(child: Text('Login',style: TextStyleModel().textStyleM)),
                SizedBox(height: padding),
//==========================================================================
// FACEBOOK BUTTON
//==========================================================================                
                FacebookSignInButton(onPressed: () {loginWithGoogle(context);}),
                SizedBox(height: padding),
//==========================================================================
// GOOGLE BUTTON
//==========================================================================                
                GoogleSignInButton(
                  onPressed: () {
                     loginWithGoogle(context).then((authResult){
                      // showMessageBox(context, "Success", authResult.displayName.toString(), actions: [dismissButton(context)]);  
//==========================================================================
// SINGLETON: SHARED CLASS
//==========================================================================
                      //result.sendEmailVerification();          
                      globalAppData.isLogin = true;
                      globalAppData.email = authResult.email;
                      globalAppData.name = authResult.displayName;     
                      globalAppData.mobile = authResult.phoneNumber;   
                      globalAppData.imageProfileUrl = authResult.photoUrl;                            
//==========================================================================
// NAVIGATE
//==========================================================================
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()),);
                    }).catchError((error){
                        showMessageBox(context, "Error", error.details, actions: [dismissButton(context)]);   
                    }).whenComplete(() => {
                    });
                  },
                  splashColor: Colors.white,
                ),
                SizedBox(height: padding),
//==========================================================================
// APPGLE BUTTON
//==========================================================================                
                AppleSignInButton(
                  onPressed: () {
                    loginWithApple(context).then((result){
                      showMessageBox(context, "Success", result.displayName.toString(), actions: [dismissButton(context)]);
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()),);                           
                    }).catchError((error){
                      showMessageBox(context, "Error", error.details, actions: [dismissButton(context)]);  
                    }).whenComplete(() => {
                      //showMessageBox(context, "Completed", 'When Completed', actions: [dismissButton(context)])
                    });
                  },
                ),
                SizedBox(height: padding),     
                           
//==========================================================================
// SIGN-IN BUTTON
//==========================================================================                
                ButtonBarWidget(
                  onPressed: () {Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignInByEmailPage()),);},
                  splashColor: Theme.of(context).primaryColor,
                  text: "Sign in by E-mail",
                ),
                SizedBox(height: padding),
                          
//==========================================================================
// TEXT
//==========================================================================                     
                Center(child: Text("Haven't got an account?",style: TextStyleModel().textStyleM)),
                SizedBox(height: padding),
//==========================================================================
// CREATE ACCOUNT BUTTON
//==========================================================================                
                FlatButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()),);
                  },
                  child: Text('Create an Account',
                      style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blue[800])),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

//==========================================================================
// LOGIN FUNCTION
//==========================================================================   
// login()=> Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()),);

}
