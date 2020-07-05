//==========================================================================
// IMPORT
//==========================================================================
import 'package:flutter/material.dart';
import '../models/TextStyleModel.dart';
import 'LoginPage.dart';
import '../services/FirebaseAuthenService.dart';
import '../widgets/LoadingWidget.dart';
import '../widgets/ButtonBarWidget.dart';
import '../widgets/TextFieldWidget.dart';

//==========================================================================
// CLASS
//==========================================================================
class LogInByEmailPage extends StatefulWidget {
 
  @override
  _LogInByEmailPageState createState() => _LogInByEmailPageState();
}

//==========================================================================
// STATE
//==========================================================================
class _LogInByEmailPageState extends State<LogInByEmailPage> {
//==========================================================================
// DECLARE VARIABLE
//==========================================================================  
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
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
            onPressed: (){Navigator.pop(context, MaterialPageRoute(builder: (context) => LoginPage()),);}
          ),
          title: Text('การล็อกอินด้วยอีเมล์'),
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
           // showCircularProgress(_isLoading),
           LoadingWidget(isLoading: _isLoading),
//==========================================================================
// TEXT: E-MAIL
//==========================================================================            
            Padding(padding: const EdgeInsets.all(8.0),child: Text('E-mail',style: TextStyleModel().textStyleMBold)),
            TextFieldWidget(controller: _emailController,text: '*อีเมล์', icon: Icons.email, textInputType: TextInputType.emailAddress,),
            TextFieldWidget(controller: _passwordController,text: '*รหัสผ่าน', icon: Icons.vpn_key, textInputType: TextInputType.visiblePassword,obscureText: true,),     
            SizedBox(height: 16),       

//==========================================================================
// BUTTON
//==========================================================================      
            ButtonBarWidget(onPressed: () {signIn(context,email: _emailController.text,password:_passwordController.text);},splashColor: Theme.of(context).primaryColor,text: "Login",),            
          ],),
        ),
      ),
    );
  }

//==========================================================================
// SHOW CURCULAR PROGRESS
//==========================================================================
  Widget showCircularProgress(bool isLoading) {
    if (_isLoading) {return Center(child: CircularProgressIndicator());}
    return Container(height: 0,width: 0.0);
  }


//==========================================================================
// FUNCTION SIGN-IN BY EMAIL
//==========================================================================  
signIn(BuildContext context, {String email, String password})
    {
//==========================================================================
// ENABLE LOADING...
//========================================================================== 
      setState(() {_isLoading = true;});
//==========================================================================
// CALL LOGIN BY EMAIL (SERVICE)
//========================================================================== 
      loginByEmail(context, email: email, password: password).then((value) {
//==========================================================================
// APP DATA
//==========================================================================          
            // globalAppData.isLogin = true;
            // globalAppData.email = email;
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
      }).whenComplete((){
//==========================================================================
// DISABLE LOADING..
//==========================================================================         
          setState(() {_isLoading = false;});

      });
      
    }

}






