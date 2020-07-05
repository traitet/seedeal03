//==========================================================================
// IMPORT
//==========================================================================
import 'package:flutter/material.dart';
import '../models/TextStyleModel.dart';
import '../screens/LoginPage.dart';
import '../services/FirebaseAuthenService.dart';
import '../singletons/GlobalAppData.dart';
import '../widgets/ButtonBarWidget.dart';
import '../widgets/TextFieldWidget.dart';

//==========================================================================
// CLASS
//==========================================================================
class SignInByEmailPage extends StatefulWidget {
 
  @override
  _SignInByEmailPageState createState() => _SignInByEmailPageState();
}

//==========================================================================
// STATE
//==========================================================================
class _SignInByEmailPageState extends State<SignInByEmailPage> {
//==========================================================================
// DECLARE VARIABLE
//==========================================================================  
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  //============================================================================
// GLOBAL KEY (SCAFFOLD FOR SNACKBAR)
//============================================================================  
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();  

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
        key: scaffoldKey,
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
//==========================================================================
// ** NEED TO BACK CALLING PAGE ** (NOT ONLY LOGIN)
//==========================================================================            
            onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()),);}
          ),
          title: Text('Sign-in by E-mail'),
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
            SizedBox(height: 16),       

//==========================================================================
// BUTTON
//==========================================================================      
            ButtonBarWidget(onPressed: () {signIn(context,email: _emailController.text,password:_passwordController.text);},splashColor: Theme.of(context).primaryColor,text: "Sign-in",),            
          ],),
        ),
      ),
    );
  }

  //==========================================================================
// FUNCTION SIGN-IN BY EMAIL
//==========================================================================  
signIn(BuildContext context, {String email, String password})
    {
      loginWithEmail(context, email: email, password: password).then((value) {
//==========================================================================
// APP DATA
//==========================================================================          
            globalAppData.isLogin = true;
            globalAppData.email = email;
      })
      .catchError((error){
//==========================================================================
// ERROR: SHOW MESSAGE
//==========================================================================  
          //showMessageBox(context, "Error", error.details, actions: [dismissButton(context)]);  
//==========================================================================
// ERROR: SNACKBAR
//==========================================================================  
          scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(error.details, style: TextStyle(color: Colors.white)),backgroundColor: Colors.red,));
      });
      
    }

}






