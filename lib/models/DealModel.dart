import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

//===============================================================
// CLASS DOC MODEL
//===============================================================
class DealModel {
  //=============================================================
  // 1) PROPERTY
  //=============================================================
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final String createdBy;
  final String docType;  
  final double price;    
  // final List<String> streets;
  // final List<WorkFlow> workflows;

  //=============================================================
  // 2) CONSTUCTURE
  //=============================================================
  DealModel({
    this.id  = Uuid.NAMESPACE_X500,
    this.name = '',
    this.description = '',
    this.imageUrl = '',
    this.createdBy = '',
    this.docType = '',
    this.price = 0,    
    // this.streets = ,
    // this.workflows ,
  }) : assert(id != null, name != null);

  //=============================================================
  // 3) MAP SNAPSHOT -> MODEL
  //=============================================================
  factory DealModel.fromFilestore(DocumentSnapshot doc) {
    Map data = doc.data;
    return DealModel(
      id: data['id'] ?? '',
      name: data['name'] ?? '',
      description: data['description'] ?? '',
      imageUrl: data['imageUrl'] ?? '',   
      createdBy: data['createdBy'] ?? '',   
      docType: data['docType'] ?? '',     
      price: data['price'] ?? 0,        
      // streets: List<String>.from(data['streets']), // CONVERT FROM LIST<dynamic> to LIST<String> 
      // workflows: List<WorkFlow>.from(data['workflows'].map((e) => WorkFlow.fromFilestore(e))),  // CONVERT FROM LIST<dynamic>(i) to LIST<workflows>(i) and map index in list
    );
  }

  //=============================================================
  // 4) MAP MODEL -> SNAPSHOT
  //=============================================================
  Map<String, dynamic> toFileStore()  {
    return {
        'id': id,
        'name': name??'',
        'description': description??'',
        'imageUrl': imageUrl??'',
        'createdBy': createdBy??'',
        'docType': docType??'',  
        'price': price??'',          
        // 'streets': streets,        
        // 'workflows': List<dynamic>.from(workflows.map((e) => e.toFileStore())),
    };
  }

  //=============================================================
  // 5) MAP JSON -> MODEL
  //=============================================================
  factory DealModel.fromJson(Map<String, dynamic> json) {
    return DealModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['imageUrl'] ?? '',   
      createdBy: json['createdBy'] ?? '',   
      docType: json['docType'] ?? '',     
      price: json['price'] ?? 0,          
      // streets: json['streets'],
      // workflows: List<WorkFlow>.from(json['workflows'].map((e) => WorkFlow.fromJson(e))),
    );
  }

  //=============================================================
  // 6) MAP MODEL -> JSON
  //=============================================================
  Map<String, dynamic> toJson()  {
    return {
        'id': id,
        'name': name??'',
        'description': description??'',
        'imageUrl': imageUrl??'',
        'createdBy': createdBy??'',
        'docType': docType??'',  
        'price': price??0,         
        // 'streets': streets,        
        // 'workflows': List<dynamic>.from(workflows).map((e) => e.toJson()),
    };
  }
}

//=============================================================
// CLASS WORKFLOW
//=============================================================
class WorkFlow {
  //=============================================================
  // 1) VARIABLE
  //============================================================= 
  String userName;
  String action;  
  String comment;  

  //=============================================================
  // 2) CONSTRUCTURE
  //=============================================================  
  WorkFlow({
    this.userName,
    this.action, 
    this.comment
    });

  //=============================================================
  // 3) FIRESTORE -> OBJECT
  //=============================================================
  factory WorkFlow.fromFilestore(Map<String, dynamic> data) {
    // Map data = doc.data;
    return WorkFlow(
      userName: data['userName'] ?? '',
      action: data['action'] ?? '',
      comment: data['comment'] ?? '',     
    );
  }


  //=============================================================
  // 4) OBJECT -> SNAPSHOT (FIRESTORE)
  //=============================================================
  Map<String, dynamic> toFileStore() => {
        'userName': userName,
        'action': action,
        'comment': comment,
      };

  //=============================================================
  // 5) JSON -> OBJECT 
  //=============================================================
  factory WorkFlow.fromJson(Map<String, dynamic> json) => WorkFlow(
      userName: json['userName'] ?? '',
      action: json['action'] ?? '',
      comment: json['comment'] ?? '',     
    );
  
  //=============================================================
  // 6) OBJECT -> JSON
  //=============================================================
  Map<String, dynamic> toJson() => {
        'userName': userName,
        'action': action,
        'comment': comment,
      };
}

//===============================================================
// CLASS USER DETAIL
//===============================================================
class Department1 {
  final String deptId;
  final String deptName;

  //=============================================================
  // CONSTUCTURE
  //=============================================================
  Department1({this.deptId, this.deptName});

  //=============================================================
  // FIRESTONE -> CLASS
  //=============================================================

  factory Department1.fromFilestore(DocumentSnapshot doc) {
    Map data = doc.data;
    return Department1(
      deptId: data['deptid'] ?? '',
      deptName: data['deptname'] ?? '',
    );
  }

  //=============================================================
  // 2) CLASS -> SNAPSHOT
  //=============================================================
  Map<String, dynamic> toFileStore() => {
        'deptid': deptId,
        'deptname': deptName,
      };
}
