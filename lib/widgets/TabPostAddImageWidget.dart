
// //==========================================================================
// // IMPORT
// //==========================================================================
// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'package:multi_image_picker/multi_image_picker.dart';
// import '../services/ImageService.dart';
// import '../services/LoggerService.dart';
// import '../services/ShowNotiService.dart';


// //==========================================================================
// // CLASS
// //==========================================================================
// class TabPostAddImageWidget extends StatefulWidget {
//   @override
//   _TabPostAddImageWidgetState createState() => new _TabPostAddImageWidgetState();
// }

// //==========================================================================
// // STATELOCAL
// //==========================================================================
// class _TabPostAddImageWidgetState extends State<TabPostAddImageWidget> {
// //==========================================================================
// // DECLARE VARIABLE
// //==========================================================================  
//   List<Asset> images = List<Asset>();
//   String _error = 'No Error Dectected';
// //==========================================================================
// // INIT STATE
// //==========================================================================
//   @override
//   void initState() {
//     super.initState();
//   }
// //==========================================================================
// // BUILD GRIDVIEW
// //==========================================================================
//   Widget buildGridView() {
//     return GridView.count(
//       crossAxisCount: 3,
//       children: List.generate(images.length, (index) {
//         Asset asset = images[index];
//         return AssetThumb(
//           asset: asset,
//           width: 300,
//           height: 300,
//         );
//       }),
//     );
//   }

// //==========================================================================
// // LOAD ASSET FUNCTION
// //==========================================================================
//   Future<void> loadAssets() async {
//     List<Asset> resultList = List<Asset>();
//     String error = 'No Error Dectected';

//     try {
//       resultList = await MultiImagePicker.pickImages(
//         maxImages: 300,
//         enableCamera: true,
//         selectedAssets: images,
//         cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
//         materialOptions: MaterialOptions(
//           actionBarColor: "#abcdef",
//           actionBarTitle: "เลือกรูปภาพ",
//           allViewTitle: "All Photos",
//           useDetailsView: false,
//           selectCircleStrokeColor: "#000000",
//         ),
//       );
//     } on Exception catch (e) {
//       error = e.toString();
//     }
//     // If the widget was removed from the tree while the asynchronous platform
//     // message was in flight, we want to discard the reply rather than calling
//     // setState to update our non-existent appearance.
//     if (!mounted) return;

// //==========================================================================
// // SET STATE
// //==========================================================================  
//     setState(() {
//       images = resultList;
//       _error = error;
//     });
//   }

// //==========================================================================
// // BUILD WIDGET
// //==========================================================================  

//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
// //==========================================================================
// // SHOW DEBUG
// //==========================================================================      
//       debugShowCheckedModeBanner: false,         
// //==========================================================================
// // THEME
// //==========================================================================
//       theme: ThemeData(
//         primarySwatch: Theme.of(context).primaryColor,
//       ),    
// //==========================================================================
// // HOME
// //==========================================================================            
//       home: Scaffold(   
//         appBar: AppBar(
//             leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.white),onPressed: () => Navigator.of(context).pop(),
//           ),
//           title: Text('รูปภาพ'),),
// //==========================================================================
// // COLUMN
// //==========================================================================          
//         body: Column(
//           children: <Widget>[
//             Center(child: Text('Error: $_error')),
// //==========================================================================
// // ROW
// //==========================================================================              
//             Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: <Widget>[
// //==========================================================================
// // BUTTON TO SELECT IMAGE
// //==========================================================================                   
//                 Expanded(child: RaisedButton(child: Text("เลือกรูปภาพ",),onPressed: loadAssets,)),
// //==========================================================================
// // UPLOAD IMAGE
// //========================================================================== 
//                 Expanded(
//                   child: RaisedButton(onPressed: (){uploadImage(assets: images, fileName: 'UPLOAD_001').then((value) {
//                     logger.i(value.toList().toString());
//                     CircularProgressIndicator();
//                   }).
//                     catchError((onError){
//                         logger.i(onError.message);
//                     }).
//                     whenComplete((){
//                         logger.i('WHEN COMPLETE');
//                         showMessageBox(context, "สำเร็จ", 'Upload Completed', actions: [dismissButton(context)]);  
//                     });
//                   },
//                     child: Text("Upload รูปภาพ",), 
//                             ),
//                 ),                
//               ],
//             ),           
// //==========================================================================
// // BUILD GRID VIEW
// //==========================================================================             
//             Expanded(child: buildGridView(),)
//           ],
//         ),
//       ),
//     );
//   }
// }