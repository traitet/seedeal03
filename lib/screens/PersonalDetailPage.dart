//==========================================================================
// IMPORT
//==========================================================================
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../singletons/GlobalAppData.dart';
import '../widgets/ButtonBarWidget.dart';
import '../widgets/TextFieldWidget.dart';
import '../models/DBUserModel.dart';
import '../services/DBUserService.dart';
import '../widgets/LoadingWidget.dart';

//==========================================================================
// MAIN CLASS
//==========================================================================
class PersonalDetailPage extends StatefulWidget {
  @override
  _PersonalDetailPageState createState() => _PersonalDetailPageState();
}

//==========================================================================
// STATE CLASS
//==========================================================================
class _PersonalDetailPageState extends State<PersonalDetailPage> {
//============================================================================
// GLOBAL KEY (SCAFFOLD FOR SNACKBAR)
//============================================================================  
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();    
//==========================================================================
// DECLARE VARIABLE
//==========================================================================  
  TextEditingController firstNameController = TextEditingController()..text = globalAppData.name;
  TextEditingController lastNameController = TextEditingController();
  TextEditingController nationalityController = TextEditingController()..text = 'Thai';    
  TextEditingController emailController = TextEditingController()..text = globalAppData.email;
  TextEditingController mobileController = TextEditingController()..text = globalAppData.mobile;
  TextEditingController lineController = TextEditingController();     
  DBUserModel dbUserModel;
  bool isLoading = false;

  //========================================================================================
  // OVERRIDE INITSTATE
  //========================================================================================
  @override
  void initState() {
    super.initState();
    Firestore.instance.collection('TM_USER').document(emailController.text).get().then((doc) {
      setState(() {
        dbUserModel = DBUserModel.fromFilestore(doc);
        firstNameController..text = dbUserModel.firstname;
        lastNameController..text = dbUserModel.lastname;
        mobileController..text = dbUserModel.mobileno;
        lineController..text = dbUserModel.lineid;
        nationalityController..text = dbUserModel.nationality;   
        isLoading = true;                     
      });
    }).catchError((error){
       scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Not Found Data', style: TextStyle(color: Colors.white)),backgroundColor: Colors.red,));
    }).whenComplete(() {
      setState(() {isLoading = false;});
    });
  }


  //========================================================================================
  // OVERRIDE BUILD WIDGET
  //========================================================================================
  @override
  Widget build(BuildContext context) {
    const padding = 15.0;
    const paddingTop = 5.0;
    // FlutterStatusbarcolor.setStatusBarColor(Theme.of(context).primaryColor);
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
        appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.white),onPressed: () => Navigator.of(context).pop(),),
          title: Text('Personal Detail'),
        ),
//==========================================================================
// BODY
//==========================================================================
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                SizedBox(height: paddingTop),
                LoadingWidget(isLoading:isLoading),
//==========================================================================
// TEXT: WELCOME
//==========================================================================
                
                Text('Personal Details',style:TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                TextFieldWidget(text: '*Name', icon: Icons.account_box,controller: firstNameController,),
                TextFieldWidget(text: '*Surname', icon: Icons.account_circle,controller: lastNameController,),
                // TextFieldWidget(text: '*Expiration Date', icon: Icons.timer),
//==========================================================================
// RADIO: GENDER
// //==========================================================================
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: <Widget>[
//                     Text('Male'),Radio(value: 1, groupValue: 0, onChanged: null),
//                     Text('Female'),Radio(value: 2,groupValue: 0,onChanged: null,),
//                   ],
//                 ),
//==========================================================================
// DROPDOWN: NATIONALITY
//==========================================================================
                TextFieldWidget(text: '*Nationality', icon: Icons.people,controller: nationalityController,),
//==========================================================================
// TEXT: CONTACT DEAIL
//==========================================================================
                Text('Contact Details',style:TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
//==========================================================================
// TEXTFIELD
//==========================================================================
                TextFieldWidget(text: 'E-mail', icon: Icons.email,controller: emailController,),
                TextFieldWidget(text: 'Mobile', icon: Icons.phone,controller: mobileController,),
                TextFieldWidget(text: 'Line ID', icon: Icons.line_style,controller: lineController,),                
//==========================================================================
// TEXT
//==========================================================================
                Text('For bookings confirmation and in the case of an emergency',style:TextStyle(fontSize: 15, fontWeight: FontWeight.normal)),
                SizedBox(height: padding),
//==========================================================================
// SIGN-IN BUTTON
//==========================================================================
                ButtonBarWidget(onPressed: () {
//==========================================================================
// SAVE USER TO DB (FIREBASE)
//==========================================================================   
    dbUserSaveService(context,documentName: emailController.text,userModel: DBUserModel(
        email: emailController.text,
        mobileno: mobileController.text,
        lineid: lineController.text,
        firstname: firstNameController.text,
        lastname: lastNameController.text,
        nationality: nationalityController.text
    )).then((value) {
//==========================================================================
// 1) AFTER CALL
//==========================================================================       
      setState(() {isLoading = true;});
//==========================================================================
// 2) ERROR
//==========================================================================       
    }).catchError((error){
        scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Save Error${{error.toString()}}', style: TextStyle(color: Colors.white)),backgroundColor: Colors.red,));
//==========================================================================
// 3) COMPLETE
//==========================================================================     
    }).whenComplete((){
      scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Save Completed', style: TextStyle(color: Colors.white)),backgroundColor: Colors.green,));
      setState(() {isLoading = false;});
    });
//==========================================================================
// SAVE USER TO DB
//==========================================================================   
                },splashColor: Colors.pink,text: "Save",),
                SizedBox(height: padding),
                SizedBox(height: padding),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
