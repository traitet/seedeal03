//==========================================================================
// IMPORT
//==========================================================================
import 'package:flutter/material.dart';
// import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import '../singletons/GlobalAppData.dart';
import '../widgets/ButtonBarWidget.dart';
import '../widgets/TextFieldWidget.dart';

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
//==========================================================================
// DECLARE VARIABLE
//==========================================================================  
  TextEditingController nameController = TextEditingController()..text = globalAppData.name;
  TextEditingController surnameController = TextEditingController();
  TextEditingController nationalityController = TextEditingController()..text = 'Thai';    
  TextEditingController emailController = TextEditingController()..text = globalAppData.email;
  TextEditingController mobileController = TextEditingController()..text = globalAppData.mobile;
  TextEditingController lineController = TextEditingController();     
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
        // backgroundColor: Colors.white,
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

//==========================================================================
// TEXT: WELCOME
//==========================================================================

                Text('Personal Details',style:TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                TextFieldWidget(text: '*Name', icon: Icons.account_box,controller: nameController,),
                TextFieldWidget(text: '*Surname', icon: Icons.account_circle,controller: surnameController,),
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
                ButtonBarWidget(onPressed: () {},splashColor: Colors.pink,text: "Save",),
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
