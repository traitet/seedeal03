import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'LoggerService.dart';
import '../models/DBUserModel.dart';

//==================================================================================
// FUNCTION: SIGNUP USER
//==================================================================================  
Future<void> dbUserSaveService(BuildContext context, {DBUserModel userModel, String documentName}){
    Map<String, dynamic> data = userModel.toFileStone();
    return Firestore.instance.collection("TM_USER").document(documentName).setData(data).then((returnData) {
      //showMessageBox(context, "Success", "Register User($documentName) to completely", actions: [dismissButton(context)]);
      logger.i("setData Success");
      }).catchError((error){
        logger.e("setDAta Error");
        logger.e(error);
      }).whenComplete(() {});
    }

// //==================================================================================
// // FUNCTION: GET USER ( WRITE IN UI)
// //==================================================================================  
// Future<void> dbUserGetService(BuildContext context, {String documentName}){
//   DBUserModel dbUserModel;
//   return Firestore.instance.collection('TM_USER').document(documentName).get().then((doc){
//       dbUserModel = DBUserModel.fromFilestore(doc);
//       return dbUserModel;
//   }).catchError((error){}).whenComplete((){});
// }