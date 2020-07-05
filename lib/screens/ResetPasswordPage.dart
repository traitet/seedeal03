//==========================================================================
// IMPORT
//==========================================================================
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:seedeal03/models/TextStyleModel.dart';

import '../widgets/ButtonBarWidget.dart';
import '../widgets/TextFieldWidget.dart';
import '../services/LoggerService.dart';

//==========================================================================
// CLASS
//==========================================================================
class ResetPasswordPage extends StatefulWidget {
 
  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

//==========================================================================
// STATE
//==========================================================================
class _ResetPasswordPageState extends State<ResetPasswordPage> {
//==========================================================================
// DECLARE VARIABLE
//==========================================================================     
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();  
//==========================================================================
// BUILD WIDGET
//==========================================================================     
  @override
  Widget build(BuildContext context) {
//==========================================================================
// DECLARE VARIABLE FOR WIDGET
//==========================================================================       
    final emailController = TextEditingController();
    return 
//==========================================================================
// SHOW DEBUG
//==========================================================================      
      // debugShowCheckedModeBanner: false,      
//==========================================================================
// THEME
//==========================================================================
      // theme: ThemeData(
      //   primarySwatch: Theme.of(context).primaryColor,
      // ),
//==========================================================================
// HOME
//==========================================================================
      // home: 
      Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.white),onPressed: () => Navigator.of(context).pop(),),
          title: Text('Reset Password'),
        ),
//==========================================================================
// BODY
//==========================================================================
        body: 
        Container(
          padding: EdgeInsets.all(8),
          color: Colors.white,
          child: ListView(

            children: <Widget>[
//==========================================================================
// TEXT
//==========================================================================
            SizedBox(height: 72),      
            Center(child: Text('Forgot your password ?',style: TextStyleModel().textStyleXL)),
            SizedBox(height: 24),          
//==========================================================================
// TEXT
//==========================================================================  
          Container(
            decoration: BoxDecoration(),
            padding: EdgeInsets.all(8),
            child: Text(
              'To reset password, enter your e-mail, press the button and check mail to follow instruction',
              maxLines: 3,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyleModel().textStyleM),),      
          SizedBox(height: 36),                     
//==========================================================================
// TEXT: E-MAIL
//==========================================================================            
          TextFieldWidget(text: '*E-mail', icon: Icons.email, textInputType: TextInputType.emailAddress,controller: emailController,),
          SizedBox(height: 36),   
//==========================================================================
// BUTTON
//==========================================================================      
          ButtonBarWidget(onPressed: () 
          {
            logger.i(emailController.text);
            resetPassword(); 
            //FILL CODE
          },splashColor: Theme.of(context).primaryColor,text: "Reset Password",),             
          ],),
        ),
      );
  } //BUILD WIDGET 

//==========================================================================
// RESET PASSWORD FUNCTION
//==========================================================================  
  resetPassword() {
      String email = emailController.text.trim();
      _auth.sendPasswordResetEmail(email: 'traitet@gmail.com');
      scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text("We send the detail to $email successfully.",
            style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green[300],
      ));
    }


} // CLASS
