//==========================================================================
// IMPORT
//==========================================================================
import 'package:path/path.dart' as Path;
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import '../singletons/GlobalAppData.dart';
import '../models/DBDealModel.dart';
import '../services/LoggerService.dart';
import '../widgets/ButtonBarWidget.dart';
import '../widgets/TextFieldPostDealWidget.dart';
import '../widgets/DatePickerWidget.dart';
import '../services/DBDealService.dart' as DealService;

//==========================================================================
// CLASS
//==========================================================================
class DealPostPage extends StatefulWidget {
//==========================================================================
// OVERRIDE
//========================================================================== 
  @override
  _DealPostPageState createState() => _DealPostPageState();
}

//==========================================================================
// STATE CLASS
//==========================================================================
class _DealPostPageState extends State<DealPostPage> {
//==========================================================================
// DECLARE VARIABLE
//==========================================================================  
  final imagePicker = ImagePicker(); 
  PickedFile _pickedFile;
  String _uploadedFileURL = ''; 
  // bool _isLoading = false;  

//==========================================================================
// BUILD WIDGET
//==========================================================================  
  @override
  Widget build(BuildContext context) {
//==========================================================================
// DECLARE VARIABLE
//==========================================================================     
    final titleController = TextEditingController()..text = 'Bangkok';
    final descriptionController = TextEditingController()..text = '3 nights with homestay including breakfast and dinner'; 
    final priceController = TextEditingController()..text = '100';     
    final firstNameController = TextEditingController()..text = 'Traitet'; 
    // final fromDateController = TextEditingController()..text = '';
    // final toDateController = TextEditingController()..text = '';      
    // final valideDateController = TextEditingController()..text = '';                
    final lastNameController = TextEditingController()..text = 'Thepbandansuk';
    final emailController = TextEditingController()..text = 'traitet@gmail.com';         
    final mobileController = TextEditingController()..text = '085-6000606';      
    final lineIdController = TextEditingController()..text = 'traitetgmail';                
    final imageUrlController = TextEditingController()..text = 'https://firebasestorage.googleapis.com/v0/b/hellotest06-88fae.appspot.com/o/hotel05.JPG?alt=media&token=355b944f-5b70-4c83-baa8-e2293fe438fb';       
//==========================================================================
// RETURN MATERIAL APP
//==========================================================================  
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
        backgroundColor: Colors.black,
        appBar: AppBar(
//==========================================================================
// ICON BUTTON
//==========================================================================          
          actions: <Widget>[
            IconButton(icon: Icon(Icons.picture_in_picture),color: Colors.white,onPressed: (){getImageFromGallery();},),             
            IconButton(icon: Icon(Icons.local_see),color: Colors.white,onPressed: (){getImageFromCamera();},), 
            ],
//==========================================================================
// BACK BUTTON
//==========================================================================             
          leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.white),onPressed: () => Navigator.of(context).pop(),),
//==========================================================================
// TITLE
//==========================================================================           
          title: Text('Post Deal - Hotel'),
//==========================================================================
// CENTER
//==========================================================================             
          // centerTitle: false,
        ),
//==========================================================================
// BODY
//==========================================================================
        body: 
        Container(
          padding: EdgeInsets.all(8),
          color: Colors.black45,
          child: ListView(children: <Widget>[
            SizedBox(height: 8),
//==========================================================================
// TEXT: E-MAIL
//==========================================================================            
            //Padding(padding: const EdgeInsets.all(8),child: Text('ที่พัก',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: Colors.white)),),
            Text('Title (หัวข้อประกาศ)',style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal, color: Colors.white),),
            TextFieldPostDealWidget(text: '*Title', icon: Icons.featured_play_list, controller: titleController),
            Text('Description (รายละเอียด)',style: TextStyle(fontSize: 10,fontWeight: FontWeight.normal, color: Colors.white),),            
            TextFieldPostDealWidget(text: '*Description', icon: Icons.format_align_left, controller: descriptionController,),    
            Text('Price (ราคา)',style: TextStyle(fontSize: 10,fontWeight: FontWeight.normal, color: Colors.white),),                 
            TextFieldPostDealWidget(text: '*Price', icon: Icons.attach_money, controller: priceController,),        
            // Text(' Description (รายละเอียด)',style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal, color: Colors.white),),                 
            // TextFieldPostDealWidget(text: 'Description', icon: Icons.attach_money, controller: priceController,),                    
            // SizedBox(height: 8),       
            // DropdownBarWidget(hintIcon: Icons.person,hintText: '2 adults, 1 room',dropdownColor: Colors.grey),
//==========================================================================
// ROW
//========================================================================== 
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('From (จากวันที่)',style: TextStyle(fontSize: 10,fontWeight: FontWeight.normal, color: Colors.white),),
                    DatePickerWidget(),                     
                  ],
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,                  
                  children: <Widget>[
                    Text('To (ถึงวันที่)',style: TextStyle(fontSize: 10,fontWeight: FontWeight.normal, color: Colors.white),),
                  DatePickerWidget(),                     
                  ],
                ),   

              ],
            ),               
//==========================================================================
// EXPIRED DATE
//========================================================================== 
            Text(' Expired Date (วันที่หมดอายุ)',style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal, color: Colors.white),),              
            DatePickerWidget(), 
//==========================================================================
// TEXT: PERSONAL DETAIL
//==========================================================================                 
            Padding(padding: const EdgeInsets.all(8),child: Text('Owner Detail (ผู้ประกาศ) ',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: Colors.white)),),                    
            TextFieldPostDealWidget(text: '*Name', icon: Icons.person,controller: firstNameController,),
            TextFieldPostDealWidget(text: 'Lastname', icon: Icons.person,controller: lastNameController,),      
            TextFieldPostDealWidget(text: 'E-mail', icon: Icons.phone,controller: emailController,),                      
            TextFieldPostDealWidget(text: 'Mobile', icon: Icons.phone,controller: mobileController,),    
            TextFieldPostDealWidget(text: 'Line ID', icon: Icons.line_style,controller: lineIdController,),        
            Padding(padding: const EdgeInsets.all(8),child: Text('Image (รูปถ่าย) ',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: Colors.white)),),                                  
            TextFieldPostDealWidget(text: 'Image', icon: Icons.recent_actors,controller: imageUrlController,),   
            SizedBox(height: 24),              
//==========================================================================
// BUTTON
//==========================================================================      
            ButtonBarWidget(onPressed: () async {      
//==========================================================================
// UPLOAD FILE
//==========================================================================  
                  if (_pickedFile != null){await fnUploadFile();}              
//==========================================================================
// CALL SERVICE: SET DATA TO FIREBASE
//==========================================================================               
                  DealService.setDeal(
                    context,
                    DBDealModel(
                      name: titleController.text,
                      description: descriptionController.text,
                      price: double.parse(priceController.text),                      
                      createdBy: globalAppData.email,                      
                      imageUrl: _uploadedFileURL,
                      lineId: lineIdController.text,
                      mobile: mobileController.text,
                      docType: 'HOTEL',
                    )
                  );
            },splashColor: Colors.pink,text: "Save",),  
//================================================================================
// BUILD WIDGET IMAGE AND TEXT (1) UPLOAD 2) GOOGLE 3) WRONG URL
//================================================================================
            SizedBox(height: 16,),
            _pickedFile != null ? 
              Image.asset(_pickedFile.path,height: 200,):
              Container(
                alignment: Alignment.center,
                child: Text('Please select image from a top button',style: TextStyle(fontSize: 16),)),
          ],),
        ),
      ),
    );
  }

//==========================================================================
// GET IMAGE FROM CAMERA
//==========================================================================    
  Future getImageFromCamera() async {
      imagePicker.getImage(source: ImageSource.camera).then((value) {
           setState(() {_pickedFile = value;});   
      }).catchError((error){}).whenComplete((){});
    }
//==========================================================================
// GET IMAGE FROM CAMERA
//==========================================================================    
  Future getImageFromGallery() async {
      imagePicker.getImage(source: ImageSource.gallery).then((value) {
           setState(() {
             _pickedFile = value;});   
      }).catchError((error){

      }).whenComplete((){
      });}
    
//==========================================================================================
// UPLOAD IMAGE TO GOOGLE STORAGE
//==========================================================================================
  Future fnUploadFile() async {
    StorageReference storageReference = FirebaseStorage.instance.ref().child('chats/${Path.basename(_pickedFile.path)}');
    StorageUploadTask uploadTask = storageReference.putFile(File(_pickedFile.path));
    await uploadTask.onComplete;
    logger.i('File Uploaded');
    await storageReference.getDownloadURL().then((fileURL) {
      setState(() {
        _uploadedFileURL = fileURL;
      
      });
    });
  }



}
