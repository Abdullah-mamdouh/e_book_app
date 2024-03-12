
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_book_app/features/user/data/models/user_model.dart';

class FirebaseCloudService {

  final FirebaseFirestore firebaseFirestore;

  FirebaseCloudService({required this.firebaseFirestore});


  addUser (UserModel user) async{
    return await firebaseFirestore.collection('users').doc(user.id).set(user.toJson());
  }

  updateUser(UserModel user) async {
    await firebaseFirestore.collection('users').doc(user.id).update(user.toJson());
  }



}