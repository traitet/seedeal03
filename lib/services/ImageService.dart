//==========================================================================
// IMPORT
//==========================================================================
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:multi_image_picker/multi_image_picker.dart';


//==========================================================================
// FUNCTION
//==========================================================================
Future<List<String>> uploadImage(
      {@required String fileName, @required List<Asset> assets}) async {
    List<String> uploadUrls = [];

    await Future.wait(assets.map((Asset asset) async {
     // ByteData byteData = await asset.requestOriginal();
      ByteData byteData = await asset.getByteData();
      List<int> imageData = byteData.buffer.asUint8List();

      StorageReference reference = FirebaseStorage.instance.ref().child(fileName);
      StorageUploadTask uploadTask = reference.putData(imageData);
      StorageTaskSnapshot storageTaskSnapshot;

      // Release the image data
      // asset.releaseOriginal();

      StorageTaskSnapshot snapshot = await uploadTask.onComplete;
      if (snapshot.error == null) {
        storageTaskSnapshot = snapshot;
        final String downloadUrl = await storageTaskSnapshot.ref.getDownloadURL();
        uploadUrls.add(downloadUrl);

        print('Upload success');
      } else {
        print('Error from image repo ${snapshot.error.toString()}');
        throw ('This file is not an image');
      }
    }), eagerError: true, cleanUp: (_) {
     print('eager cleaned up');
    });

    return uploadUrls;
}