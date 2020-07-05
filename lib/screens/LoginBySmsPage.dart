//==========================================================================
// IMPORT
//==========================================================================
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//==========================================================================
// MAIN CLASS
//==========================================================================
class LoginBySmsPage extends StatefulWidget {
//==========================================================================
// OVERRIDE STATE
//==========================================================================  
  @override
  _LoginBySmsPageState createState() {
    return _LoginBySmsPageState();
  }
}

//==========================================================================
// STATE CLASS
//==========================================================================
class _LoginBySmsPageState extends State<LoginBySmsPage> {
//==========================================================================
// DECLARE VARIABLE
//==========================================================================  
  bool isLoading = false;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String verificationId;
  String phoneNo = "Your number here";
  String smsCode;
//==========================================================================
// OVERRIDE INIT STATE
//==========================================================================
  @override
  void initState() {super.initState();isSignedIn();}

//==========================================================================
// IS-SIGNIN FUNCTION
//==========================================================================
  void isSignedIn() async {
    this.setState(() {isLoading = true;});
//==========================================================================
// AUTHEN
//==========================================================================
    firebaseAuth.currentUser().then((user) {
      if (user != null) {
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => HomeRoute()),);
      } else {verifyPhone();}});
    this.setState(() {isLoading = false;});
  }

//==========================================================================
// VERIFY PHONE FUNCTION
//==========================================================================
  Future<void> verifyPhone() async {
    final PhoneVerificationCompleted verificationCompleted = (AuthCredential credential) {print("verified");};

    final PhoneVerificationFailed verifyFailed = (AuthException exception) {print("${exception.message}");};

    final PhoneCodeSent smsCodeSent = (String verId, [int forceCodeResend]) {
      this.verificationId = verId;
      smsCodeDialog(context).then((value) {print("Signed in");});
    };

    final PhoneCodeAutoRetrievalTimeout autoRetrieval = (String verId) {this.verificationId = verId;};

    await firebaseAuth.verifyPhoneNumber(
        phoneNumber: this.phoneNo,
        codeAutoRetrievalTimeout: autoRetrieval,
        codeSent: smsCodeSent,
        timeout: const Duration(seconds: 10),
        verificationCompleted: verificationCompleted,
        verificationFailed: verifyFailed);
  }
//==========================================================================
// BUILD FUNCTION
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
      theme: ThemeData(primarySwatch: Theme.of(context).primaryColor,),
//==========================================================================
// HOME
//==========================================================================    
      home: Scaffold(
        appBar: AppBar(title: const Text('Login by SMS 1234'),),
        body: Center(
          child: RaisedButton(
              child: Text("Verify"),
              onPressed: () {
                verifyPhone();
              }),
        ),
      ),
    );
  }
//==========================================================================
// SMS DIALOG FUNCTION
//==========================================================================  
  Future<bool> smsCodeDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: Text('Enter sms Code'),
            content: TextField(
              onChanged: (value) {
                this.smsCode = value;
              },
            ),
            contentPadding: const EdgeInsets.all(10.0),
            actions: <Widget>[
              new FlatButton(
                child: Text("Done"),
                onPressed: () {
                  firebaseAuth.currentUser().then((user) {
                    if (user != null) {
                      Navigator.of(context).pop();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomeRoute()),
                      );
                    } else {
                      Navigator.of(context).pop();
                      signIn();
                    }
                  });
                },
              )
            ],
          );
        });
  }
//==========================================================================
// SIGN-IN FUNCTION
//==========================================================================
  signIn() async {
    AuthCredential credential = PhoneAuthProvider.getCredential(
        verificationId: verificationId, smsCode: smsCode);
    await firebaseAuth.signInWithCredential(credential).then((user) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeRoute()),
      );
      print('signed in with phone number successful: user -> $user');
    }).catchError((onError) {
      print(onError);
    });
  }
}

//==========================================================================
// HOME ROUTE FUNCTION
//==========================================================================
class HomeRoute extends StatefulWidget {
  @override
  _HomeRouteState createState() {
    return _HomeRouteState();
  }
}

//==========================================================================
// HOME ROUTE STATE
//==========================================================================
class _HomeRouteState extends State<HomeRoute> {
  @override
  void initState() {
    super.initState();
  }
//==========================================================================
// BUILD WIDGET FUNCTION
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
      theme: ThemeData(primarySwatch: Theme.of(context).primaryColor,),
//==========================================================================
// HOME
//==========================================================================        
      home: Scaffold(
        appBar: AppBar(title: const Text('Login by SMS 1234'),),
        body: Center(child: Text("Welcome There."),),
      ),
    );
  }
}