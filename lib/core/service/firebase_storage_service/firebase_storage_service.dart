
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageService {

  FirebaseStorage firebaseStorage;

  FirebaseStorageService({required this.firebaseStorage});


  Future<String> uploadFileToStorage({required File file, required String type}) async{
      Reference ref =
      firebaseStorage.ref().child('$type/${DateTime.now().millisecondsSinceEpoch}');
      UploadTask uploadTask = ref.putFile(file, SettableMetadata(contentType: '$type'));

      TaskSnapshot snapshot = await uploadTask;

      String url = await snapshot.ref.getDownloadURL();
      return url;

  }

}