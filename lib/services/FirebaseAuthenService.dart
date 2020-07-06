
import 'package:apple_sign_in/apple_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../singletons/GlobalAppData.dart';
import '../screens/HomePage.dart';
import '../screens/LoginPage.dart';
import '../screens/SignUpPage.dart';
import '../services/LoggerService.dart';
import '../services/ShowNotiService.dart';

//============================================================================
// DECLARE VARIABLE
//============================================================================  
final GoogleSignIn googleSignIn = GoogleSignIn();
final FirebaseAuth _auth = FirebaseAuth.instance;


//=================================================================================
// FUNCTION#1 LOGIN WITH GOOGLE
//=================================================================================
Future<FirebaseUser> loginWithGoogle(BuildContext context) async {
  final GoogleSignInAccount googleUser = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
  final AuthCredential credential = GoogleAuthProvider.getCredential(
      idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);
      AuthResult authResult = await _auth.signInWithCredential(credential);
  return authResult.user;
}

//=================================================================================
// FUNCTION#2 LOGIN BY FIREBASE (USER NAME AND PASSWORD)
//=================================================================================
Future<bool> loginByEmail(BuildContext context,{@required String email, @required String password}) {
//=================================================================================
// RETURN
//=================================================================================
  return _auth.signInWithEmailAndPassword(email: email, password: password).then((result) {
//=================================================================================
// LOGIN COMPLETED
//=================================================================================    
        logger.i("Welcome " + result.user.uid);
        //Navigator.pop(context);
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => HomePage()),);
        globalAppData.isLogin = true;
        globalAppData.email = email;
        globalAppData.userName = result.user.displayName;
        globalAppData.imageProfileUrl = result.user.photoUrl;
        globalAppData.mobile = result.user.phoneNumber;
    return true;
//=================================================================================
// LOGIN ERROR
//=================================================================================    
  }).catchError((error) {
    logger.e(error);
    String _errormsg = '';
//=================================================================================
// BLANK ERROR OR PASSWORD
//=================================================================================      
    // if (email == '') {throw PlatformException(code: error.code,details: 'Fill E-mail',);}
    // if (password == '') {throw PlatformException(code: error.code,details: 'Fill Password',);}    
//=================================================================================
// OTHER ERROR CODE
//=================================================================================  
    switch (error.code) {
      case "ERROR_WRONG_PASSWORD":
        _errormsg = "Wrong Password! Try again.";
        throw PlatformException(code: error.code,details: _errormsg,);        
        break;
      case "ERROR_INVALID_EMAIL":
        _errormsg = "Email is not correct!, Try again";
        throw PlatformException(code: error.code,details: _errormsg,);               
        break;
      case "ERROR_USER_NOT_FOUND":
        _errormsg = "User not found! Register first!";        
        Navigator.push(context,MaterialPageRoute(builder: (context) => SignUpPage()),);
        throw PlatformException(code: error.code,details: _errormsg,);           
        break;
      case "ERROR_USER_DISABLED":
        _errormsg = "User has been disabled!, Try again";
        throw PlatformException(code: error.code,details: _errormsg,);           
        break;
      case "ERROR_TOO_MANY_REQUESTS":
        _errormsg = "Sign in disabled due to too many requests from this user!, Try again";
        throw PlatformException(code: error.code,details: _errormsg,);           
        break;
      case "ERROR_OPERATION_NOT_ALLOWED":
        _errormsg = "Operation not allowed!, Please enable it in the firebase console";
        throw PlatformException(code: error.code,details: _errormsg,);           
        break;
      case "ERROR_NETWORK_REQUEST_FAILED":
        _errormsg = "Network Error";
        throw PlatformException(code: error.code,details: error.message,);           
        break;        
      default: 
      _errormsg = "Unknown error";
        throw PlatformException(code: error.code,details: error.message,);           
        break;   
    }
// //=================================================================================
// // SHOW ERROR MESSAGE
// //=================================================================================    
//        showMessageBox(context, "Error", error.details, actions: [dismissButton(context)]);  

    // return false;
  });
}

//=================================================================================
// FUNCTION: GET CURRENT USER
//=================================================================================
Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser user = await _auth.currentUser();
    return user;
  }
//=================================================================================
// FUNCTION: SEND EMAL VERIFICATION
//=================================================================================
Future<void> sendEmailVerification() async {
    FirebaseUser user = await _auth.currentUser();
    user.sendEmailVerification();
  }
//=================================================================================
// FUNCTION: IS EMAIL VERIFIED
//=================================================================================
Future<bool> isEmailVerified() async {
    FirebaseUser user = await _auth.currentUser();
    return user.isEmailVerified;
  }

//=================================================================================
// FUNCTION#3 REGISTER WITH EMAIL
//=================================================================================
Future<bool> registerWithEmail(BuildContext context,{@required email, @required password, @required repassword}) {
  return _auth
      .createUserWithEmailAndPassword(email: email, password: password)
      .then((data) {
    logger.i("Registation Success");
    logger.i(data.user.uid);
    return true;
  }).catchError((e) {
    logger.i("Error: " + e);
    return false;
  });
}

//=================================================================================
// FUNCTION#4 LOGIN BY APPLE
//=================================================================================
Future<FirebaseUser> loginWithApple(BuildContext context) async {
//=================================================================================
// CHECK APPLE SIGN-IN IS OK
//=================================================================================  
  if (await AppleSignIn.isAvailable()) {
    final AuthorizationResult result = await AppleSignIn.performRequests([AppleIdRequest(requestedScopes: [Scope.email, Scope.fullName])]);
    AuthCredential credential;
//=================================================================================
// LOGIN STATUS
//=================================================================================    
    switch (result.status) {
      case AuthorizationStatus.authorized:
        credential = OAuthProvider(providerId: "apple.com").getCredential(
          idToken: String.fromCharCodes(result.credential.identityToken),
          accessToken: String.fromCharCodes(result.credential.authorizationCode),);
        break;
      case AuthorizationStatus.error:
        logger.i("Error: " + result.error.localizedDescription);
        throw PlatformException(
          code: "SIGN_IN_WITH_APPLE_FAILED",
          details: result.error.localizedDescription,
        );
        break;
      case AuthorizationStatus.cancelled:
        logger.i("User Cancelled");
        throw PlatformException(
          code: "USER_CANCELLED_LOGIN",
          details: "The user calcelled the login process",
        );
        break;
    }
    return (await _auth.signInWithCredential(credential)).user;
//=================================================================================
// DEVICE NOT SUPPORT APPLE SIGN-IN
//=================================================================================    
  } else {
    // logger.i("Unsupported sign in with apple");
    throw PlatformException(
      code: "UNSUPPORTED_SIGN_IN_WITH_APPLE",
      details: "There is no sign in with apple supported on this device",
    );
  }
}

//=================================================================================
// FUNCTION#5 CHECK AUTHEN
//=================================================================================
Future checkAuth(BuildContext context) async {
    FirebaseUser user = await _auth.currentUser();
    if (user != null) {
      logger.i("Already singed-in with");
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));}
  }



//==========================================================================
// FUNCTION#6 SIGN-UP
//==========================================================================   
Future firebaseCreateUserWithEmailAndPassword(BuildContext context,{String email, String password, String confirmPassword}) async {
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
        //showMessageBox(context, "Success", 'Register Completed. Select the link in the email to activate your account.', actions: [dismissButton(context)]);        
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


//=================================================================================
// SIGN-OUT
//=================================================================================
void signOut(BuildContext context) {
    _auth.signOut();
//=================================================================================
// CLAR SHARED DATA
//=================================================================================    
        globalAppData.email = '';
        globalAppData.name = '';     
        globalAppData.mobile = '';   
        globalAppData.imageProfileUrl = '';      
        globalAppData.surname = '';
//=================================================================================
// NAVIGATE TO LOGIN
//=================================================================================        
    Navigator.pushAndRemoveUntil(context,CupertinoPageRoute(builder: (context) => LoginPage()),ModalRoute.withName('/LoginPage'));
    //Navigator.pop(context);
    //Navigator.of(context).pushNamedAndRemoveUntil('/LoginPage', (Route<dynamic> route) => false);
    // Navigator.of(context).popUntil((route) => route.isFirst);
    //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()),);
  }  



//=================================================================================
// FUNCTION# LOGIN WITH LINE
//=================================================================================
Future<bool> loginWithLine(BuildContext context) async{
  return true;
}


//=================================================================================
// FUNCTION# LOGIN WITH FACEBOOK (NOT FINISHED: SEE BELOW)
// https://benzneststudios.com/blog/flutter/facebook-login-with-firebase-auth-in-flutter/
//=================================================================================
Future loginWithFacebook(BuildContext context) async {
//     FacebookLogin facebookLogin = FacebookLogin();
//     FacebookLoginResult result = await facebookLogin
//         .logInWithReadPermissions(['email', "public_profile"]);
 
//     String token = result.accessToken.token;
//     print("Access token = $token");
//     await _auth.signInWithCredential(
//         FacebookAuthProvider.getCredential(accessToken: token));
//     checkAuth(context); // after success, navigate to home.
//   }

// //=================================================================================
// // FUNCTION# LOGIN WITH PHONE
// //=================================================================================
// Future<bool> loginWithPhone(BuildContext context) async{
//   return true;
}