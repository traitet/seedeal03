//==========================================================================
// IMPORT
//==========================================================================
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../singletons/GlobalAppData.dart';
import '../widgets/TextFieldWidget.dart';
import '../models/DBUserModel.dart';
import '../widgets/LoadingWidget.dart';


//==========================================================================
// MAIN CLASS
//==========================================================================
class TabPostContactWidget extends StatefulWidget {
    const TabPostContactWidget({
    Key key,
  }) : super(key: key);
  @override
  _TabPostContactWidgetState createState() => _TabPostContactWidgetState();
}

//==========================================================================
// STATE CLASS
//==========================================================================
class _TabPostContactWidgetState extends State<TabPostContactWidget> { 
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
    return  Center(
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

                SizedBox(height: padding),
              ],
            ),
          ),
        
    );
  }
}
