//==========================================================================
// IMPORT
//==========================================================================
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../services/LoggerService.dart';
import '../services/ShowNotiService.dart';
import '../widgets/ButtonBarWidget.dart';
import '../widgets/TextFieldWidget.dart';
import '../models/TextStyleModel.dart';

//==========================================================================
// CLASS
//==========================================================================
class SignUpPage extends StatefulWidget {
 
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

//==========================================================================
// STATE
//==========================================================================
class _SignUpPageState extends State<SignUpPage> {
//==========================================================================
// DECLARE VARIABLE
//==========================================================================  
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();    
//==========================================================================
// OVERRIDE BUILD WIDGET
//==========================================================================  
  @override
  Widget build(BuildContext context) {

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
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text('Sign-up'),
        ),
//==========================================================================
// BODY
//==========================================================================
        body: 
        Container(
          padding: EdgeInsets.all(8),
          color: Colors.white,
          child: ListView(children: <Widget>[
            SizedBox(height: 8),
//==========================================================================
// TEXT: E-MAIL
//==========================================================================            
            Padding(padding: const EdgeInsets.all(8.0),child: Text('E-mail',style: TextStyleModel().textStyleMBold)),
            TextFieldWidget(controller: _emailController,text: '*E-mail', icon: Icons.email, textInputType: TextInputType.emailAddress,),
            TextFieldWidget(controller: _passwordController,text: '*Password', icon: Icons.vpn_key, textInputType: TextInputType.visiblePassword,obscureText: true,),    
            TextFieldWidget(controller: _confirmPasswordController,text: '*Confirm Password', icon: Icons.vpn_key, textInputType: TextInputType.visiblePassword,obscureText: true,),    
            SizedBox(height: 16),       

//==========================================================================
// BUTTON
//==========================================================================      
            ButtonBarWidget(onPressed: () {
              firebaseCreateUserWithEmailAndPassword(context, email: _emailController.text, password: _passwordController.text, confirmPassword: _confirmPasswordController.text);               
            },splashColor: Theme.of(context).primaryColor,text: "Save",),            
          ],),
        ),
      ),
    );
  }
}

//******************************************************************************************************************************************
// FUNCTION/WIDGET -> MOVE TO SERVICE ( )
//******************************************************************************************************************************************
//==========================================================================
// FUNCTION: SIGN UP
//==========================================================================   
firebaseCreateUserWithEmailAndPassword(BuildContext context,{String email, String password, String confirmPassword}) {
//==========================================================================
// DECLARE VARIABLE
//==========================================================================    
    FirebaseAuth _auth = FirebaseAuth.instance;
//==========================================================================
// VAIDATION
//==========================================================================     
    if (password == confirmPassword && password.length >= 6) {
//==========================================================================
// SIGNUP SUCCESS
//==========================================================================       
        _auth.createUserWithEmailAndPassword(email: email, password: password).then((authenResult) {
        logger.i("Sign up user successful.");
        logger.i(authenResult.toString());
        showMessageBox(context, "Success", 'Register Completed. Select the link in the email to activate your account.', actions: [dismissButton(context)]);        
//==========================================================================
// SIGNUP ERROR
//==========================================================================         
      }).catchError((error) {
         logger.e(error.message);
        showMessageBox(context, "Error", error.message, actions: [dismissButton(context)]);
      });
//==========================================================================
// VALIDATE ERROR
//==========================================================================       
    } else {
      logger.e("Password and Confirm-password do not match");
    }
  }
