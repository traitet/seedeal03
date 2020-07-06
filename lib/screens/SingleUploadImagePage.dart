
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;
import '../widgets/LoadingWidget.dart';

class SingleUploadImagePage extends StatefulWidget {
  @override
  _SingleUploadImagePageState createState() => _SingleUploadImagePageState();
}

class _SingleUploadImagePageState extends State<SingleUploadImagePage> {
//==========================================================================
// GET DECLARE VARIABLE
//==========================================================================
  final imagePicker = ImagePicker();    
  PickedFile _pickedFile;
  String _imageURL = '';
  bool _isLoading = false;
  //Creating a global Variable    
  StorageReference storageReference = FirebaseStorage.instance.ref();
  
//==========================================================================
// BUILD WIDGET
//========================================================================== 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
    appBar: AppBar(
      actions: <Widget>[
        IconButton(icon: Icon(Icons.local_see), onPressed: (){getImageFromCamera(); }),     
        IconButton(icon: Icon(Icons.picture_in_picture), onPressed: (){getImageFromGalary(); }),            
      ],
      title: Text('Upload Single Image')),
//==========================================================================
// BODY
//==========================================================================       
      body: ListView(children: <Widget>[

//==========================================================================
// BUTTTON
//==========================================================================   
      RaisedButton(onPressed: (){
        fnUploadFile()
          .then((value){})
          .whenComplete(() {});
      },child: Text('Upload Image to Google Cloud'),),       
//==========================================================================
// LOADING
//==========================================================================
        LoadingWidget(isLoading: _isLoading,),        
//==========================================================================
// TEXT
//==========================================================================          
        _pickedFile != null ? Container(
          color: Colors.yellow,
          child: Text('Local image file: ' + _pickedFile.path)):Text('Click a top button to pick image'),       
        _imageURL != null ? Container(
          color: Colors.blue,
          child: Text('Upload Completed with URL: ' + _imageURL)):Text('')   ,
//==========================================================================
// IMAGE
//==========================================================================          
        _pickedFile != null ?  Image(image: AssetImage(_pickedFile.path)):Container(),             
      ],
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
  Future getImageFromGalary() async {
      imagePicker.getImage(source: ImageSource.gallery).then((value) {
           setState(() {
             _pickedFile = value;});   
      }).catchError((error){

      }).whenComplete((){
      });}

  //======================================================================================
  // FUNCTION#2: UPLOAD
  //======================================================================================
  Future fnUploadFile() async {
      setState(() {_isLoading = true;});
    StorageReference storageReference = FirebaseStorage.instance.ref().child('seedel/${Path.basename(_pickedFile.path)}');
    StorageUploadTask uploadTask = storageReference.putFile(File(_pickedFile.path));
    await uploadTask.onComplete;
    await storageReference.getDownloadURL().then((fileURL) {
      setState(() {
        _imageURL = fileURL;
        print('Upload compelte with URL: $_imageURL');
      });
    }).whenComplete(() {
      setState(() {_isLoading = false;});
    });
  }

  //======================================================================================
  // FUNCTION#2: UPLOAD
  //======================================================================================
Future<void> addImageToFirebase() async {
    //CreateRefernce to path.
    StorageReference ref = storageReference.child("seedel01/");

    //StorageUpload task is used to put the data you want in storage
    //Make sure to get the image first before calling this method otherwise _image will be null.

    StorageUploadTask storageUploadTask = ref.child(Path.basename(_pickedFile.path)).putFile(File(_pickedFile.path));

     if (storageUploadTask.isSuccessful || storageUploadTask.isComplete) {
          final String url = await ref.getDownloadURL();
          print("The download URL is " + url);
     } else if (storageUploadTask.isInProgress) {
          storageUploadTask.events.listen((event) {
          double percentage = 100 *(event.snapshot.bytesTransferred.toDouble() 
                               / event.snapshot.totalByteCount.toDouble());  
          print("THe percentage " + percentage.toString());
          });
          StorageTaskSnapshot storageTaskSnapshot =await storageUploadTask.onComplete;
          _imageURL = await storageTaskSnapshot.ref.getDownloadURL();

          //Here you can get the download URL when the task has been completed.
          print("Download URL " + _imageURL.toString());

     } else{
          //Catch any cases here that might come up like canceled, interrupted 
     }

}
       

}



