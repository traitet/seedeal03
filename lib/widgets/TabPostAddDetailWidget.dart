
//==========================================================================
// IMPORT
//==========================================================================
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../services/LoggerService.dart';
import '../widgets/ButtonBarWidget.dart';
import '../widgets/LoadingWidget.dart';
import '../widgets/InputSwitchWidget.dart';
import '../widgets/InputLineWidget.dart';
import '../widgets/InputSectionSeparatorWidget.dart';
import '../widgets/InputCurrencyWidget.dart';
import '../widgets/InputDropDownWidget.dart';
import '../widgets/InputDateWidget.dart';
import '../models/DBDealModel.dart';
import '../services/DBDealService.dart' as DBDealService;
import 'package:path/path.dart' as Path;


//==========================================================================
// TAB:1 ADD DETAIL
//==========================================================================

class TabPostAddDetailWidget extends StatefulWidget {
//==========================================================================
// CONSTRCUTURE
//==========================================================================  
  const TabPostAddDetailWidget({
    Key key,
  }) : super(key: key);  
  @override
  _TabPostAddDetailWidgetState createState() => _TabPostAddDetailWidgetState();
}

//==========================================================================
// STATE CLASS
//==========================================================================
class _TabPostAddDetailWidgetState extends State<TabPostAddDetailWidget> {
//==========================================================================
// VARIABLE
//========================================================================== 
 // GlobalKey<ScaffoldState> scaffoldKey = GlobalKey(); 
  File _image;
  String _uploadedFileURL = ''; 
  final picker = ImagePicker();  
  bool _isLoading = false;
//==========================================================================
// BUILD WIDGET
//==========================================================================  
  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController()..text = 'Bangkok';
    final descriptionController = TextEditingController()..text = '3 nights with homestay including breakfast and dinner'; 
    final priceController = TextEditingController()..text = '100';     
    final nameController = TextEditingController()..text = 'Traitet'; 
    final urlControler = TextEditingController()..text = 'https://firebasestorage.googleapis.com/v0/b/hellotest06-88fae.appspot.com/o/hotel05.JPG?alt=media&token=355b944f-5b70-4c83-baa8-e2293fe438fb';        
    return 
    ListView(children: <Widget>[
      //SectionWidget(),   
//==========================================================================
// TEXT "URL"
//==========================================================================                 
        Padding(padding: const EdgeInsets.only(left: 10),child: Text('Title'),),
        Padding(padding: const EdgeInsets.only(left:8, top: 4, bottom:4),child: CupertinoTextField(style: TextStyle(color: Colors.grey),decoration: BoxDecoration(border: null),placeholder: 'Title',controller: titleController,clearButtonMode: OverlayVisibilityMode.editing,),),   
        InputLineWidget(),           
        Padding(padding: const EdgeInsets.only(left: 10),child: Text('Description'),),        
        Padding(padding: const EdgeInsets.only(left:8, top: 4, bottom:4),child: CupertinoTextField(style: TextStyle(color: Colors.grey),minLines: 1,maxLines: 4, decoration: BoxDecoration(border: null),placeholder: 'Description',controller: descriptionController,clearButtonMode: OverlayVisibilityMode.editing,),),           
        InputLineWidget(),     
        Padding(padding: const EdgeInsets.only(left: 10),child: Text('Name'),),        
        Padding(padding: const EdgeInsets.only(left:8, top: 4, bottom:4),child: CupertinoTextField(style: TextStyle(color: Colors.grey),minLines: 1,maxLines: 1, decoration: BoxDecoration(border: null),placeholder: 'Name',controller: nameController,clearButtonMode: OverlayVisibilityMode.editing,),),           
        InputLineWidget(),               
        InputDropdownWidget(title: 'Room', text: '2 Rooms'), 
        InputLineWidget(),          
        InputDropdownWidget(title: 'Max Guest', text: '4 people'),         
        InputLineWidget(),                 
        InputDateWidget(title: 'From', text: '7 Jul 2020'),  
        InputLineWidget(),                 
        InputDateWidget(title: 'To', text: '10 Jul 2020'),       
        InputLineWidget(),                 
        InputCurrencyWidget(title: 'Price (Baht)', price: 0, controller: priceController,),                    
        InputSectionSeparatorWidget(),    
        InputSwitchWidget(title: 'Breakfast', isSelect: true),     
        InputLineWidget(),           
        InputSwitchWidget(title: 'Allow Pet', isSelect: true),     
        InputLineWidget(),     
        InputSwitchWidget(title: 'Allow Party', isSelect: false),     
        InputLineWidget(),           
        InputDropdownWidget(title: 'Location', text: 'Yan Nawa, Bangkok'),       
        InputLineWidget(),                       
//==========================================================================
// TEXT "NOTE"
//==========================================================================     
        Padding(padding: const EdgeInsets.only(left:8, top: 4, bottom:4),child: CupertinoTextField(decoration: BoxDecoration(border: null),placeholder: 'URL',controller: urlControler,clearButtonMode: OverlayVisibilityMode.editing,),), 
        InputLineWidget(),                                    
        Padding(padding: const EdgeInsets.only(left:8,top: 4, bottom:4),child: CupertinoTextField(decoration: BoxDecoration(border: null),maxLines: 5,placeholder: 'Note',controller: TextEditingController(text: ''),clearButtonMode: OverlayVisibilityMode.editing,),),  
        InputLineWidget(),       
//==========================================================================
// UPLOAD IMAGE
//==========================================================================
        FlatButton(child: Text('Click to upload image'),color: Colors.black12,onPressed: (){getImageFromGallery();},),             
        // RaisedButton(child: Text('Upload from Camera'),color: Colors.black,onPressed: (){getImageFromCamera();},), 
//==========================================================================
// SHOW FILE
//=========================================================================          
        _image != null ?  Image(image: AssetImage(_image.path)):Container(),    
    
//==========================================================================
// BUTTON
//==========================================================================      
        ButtonBarWidget(onPressed: () async {      
//==========================================================================
// UPLOAD FILE
//==========================================================================
        if (_image != null){await fnUploadFile();}              
//==========================================================================
// CALL SERVICE: SET DATA TO FIREBASE
//========================================================================== 
          setState(() {_isLoading = true;});
          logger.i('System is saving data');
          
          DBDealService.setDeal(
          context,
          DBDealModel(
            title: titleController.text,
            description: descriptionController.text,
            price: double.parse(priceController.text),  
            firstName: nameController.text, 
            lastName: 'Thepbandansuk',
            email: 'traitet@gmail.com',
            mobile: '085-6000606',                   
            createdBy: nameController.text,                      
            imageUrl: _uploadedFileURL,
            docType: 'HOTEL',
            )
          ).then((value) {

          }
            
          ).whenComplete((){
            setState(() {_isLoading = false;});
            logger.i('Save data completed');
            
//==========================================================================
// SNACK BAR
//==========================================================================
            //scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("Register Deal successfully.",style: TextStyle(color: Colors.white)),backgroundColor: Colors.green[300],)); 
          });},splashColor: Colors.orange,text: "Save",), 
//==========================================================================
// LOADING
//==========================================================================
          LoadingWidget(isLoading:_isLoading),    

    ],);    
} //END BUILD WIDGET


//==========================================================================
// GET IMAGE FROM CAMERA
//==========================================================================    
  Future getImageFromCamera() async {
      final pickedFile = await picker.getImage(source: ImageSource.camera);
      setState(() {
        _image = File(pickedFile.path);
      });
    }
//==========================================================================  
// GET IMAGE FROM GALLERY
//==========================================================================    
  Future getImageFromGallery() async {
      final pickedFile = await picker.getImage(source: ImageSource.gallery);
      setState(() {
        _image = File(pickedFile.path);
      });
    }
    
//==========================================================================================
// UPLOAD IMAGE TO GOOGLE STORAGE
//==========================================================================================
  Future fnUploadFile() async {
    StorageReference storageReference = FirebaseStorage.instance.ref().child('posedeal/${Path.basename(_image.path)}}');
    StorageUploadTask uploadTask = storageReference.putFile(_image);
    await uploadTask.onComplete;
    logger.i('File Uploaded');
    await storageReference.getDownloadURL().then((fileURL) {
      setState(() {
        _uploadedFileURL = fileURL;
      
      });
    });
  }


} // END CLASS



