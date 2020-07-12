//==========================================================================
// IMPORT
//==========================================================================
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import '../models/DBDealModel.dart';
import '../services/ShowNotiService.dart';
import 'LoggerService.dart';


//==========================================================================
// FUNCTION
//==========================================================================
Future<void> setDeal(BuildContext context,DBDealModel dealModel){
//==========================================================================
// RETURN
//==========================================================================     
    return
//==========================================================================
// SAVE DATA TO FIREBASE
//==========================================================================     
    Firestore.instance.collection("TT_POSTITEM").document().setData(dealModel.toFileStore()).then((returnData) {
//==========================================================================
// SHOW MESSAGEBOX (SUCCESS)
//==========================================================================      
    showMessageBox(context, "success", "Register completely", actions: [dismissButton(context)]);   
    logger.i("setData Success");
//==========================================================================
// CATCH ERROR
//==========================================================================       
      }).catchError((e){
        logger.e("setDAta Error");
        logger.e(e);
      });
    }


//==========================================================================
// FUNCTION
//==========================================================================
Future<List<DBDealModel>> getDealList(){
//==========================================================================
// RETURN
//==========================================================================     
    return
//==========================================================================
// SAVE DATA TO FIREBASE
//==========================================================================     
    Firestore.instance.collection("TT_POSTITEM").getDocuments().then((returnData) {
//==========================================================================
// SHOW MESSAGEBOX (SUCCESS)
//==========================================================================      
    logger.i("Get Data Success"); 
    returnData.documents.forEach((f) => logger.i('${f.data}}'));
    logger.i(List<DBDealModel>.from(returnData.documents.map((e) => DBDealModel.fromFilestore(e))));
    return List<DBDealModel>.from(returnData.documents.map((e) => DBDealModel.fromFilestore(e)));
//==========================================================================
// CATCH ERROR
//==========================================================================       
      }).catchError((e){
        logger.e("Get Data Error");
        logger.e(e);
      });
    }

