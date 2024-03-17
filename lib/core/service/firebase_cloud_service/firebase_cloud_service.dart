
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_book_app/features/book/data/models/book_model.dart';
import 'package:e_book_app/features/user/data/models/user_model.dart';
import 'package:flutter/material.dart';

class FirebaseCloudService {

  final FirebaseFirestore firebaseFirestore;

  FirebaseCloudService({required this.firebaseFirestore});


  addUser(UserModel user) async{
    return await firebaseFirestore.collection('users').doc(user.id).set(user.toJson());
  }

  updateUser(UserModel user) async {
    await firebaseFirestore.collection('users').doc(user.id).update(user.toJson());
  }

  getUser(String id) async{
    final user = await firebaseFirestore.collection('users').doc(id).get();
    return UserModel.fromJson(user.data() as Map<String, dynamic>);
  }
  Future<List<UserModel>>getNotActiveUsers() async {
    final  users = await firebaseFirestore.collection('users').where('isActive', isEqualTo: false).get();
    final userList = users.docs.map((e) => UserModel.fromJson(e.data() as Map<String, dynamic>)).toList();
    return userList;
  }
  
  addBook(BookModel book) async{
    return await firebaseFirestore.collection('books').doc().set(book.toJson());
  }

  Future<List<BookModel>>getAllBooks() async {

    final  books = await firebaseFirestore.collection('books').get();
    final bookList = books.docs.map((e) => BookModel.fromJson(e.data() as Map<String, dynamic>)).toList();
    print(bookList[0].authorName.toString());
    return bookList;
  }


}