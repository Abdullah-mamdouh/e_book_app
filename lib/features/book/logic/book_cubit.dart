

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/book_model.dart';
import '../data/repo/book_repo.dart';
import 'book_state.dart';

class BookCubit extends Cubit<BookState> {
  //final InternetCheckerImpl internetChecher;
  final BookRepo bookRepo;
  BookCubit({//required this.internetChecher,
    required this.bookRepo}) : super(const BookState.initial());

  static BookCubit get(context) => BlocProvider.of<BookCubit>(context);

  final TextEditingController authorName = TextEditingController();
  final TextEditingController category = TextEditingController();
  File? coverImage;
  File? bookPDF;
  String coverImageURL = '';
  String  bookURL = '';

  emitaddBookStates(BookModel bookModel) async {
    emit(const BookState.loading());
    //if(await internetChecher.isConnected){
    final response = await bookRepo.addBook(bookModel);
    response.when(success: (book) {
      //emit(BookState.success(book));
    }, failure: (error) {
      emit(BookState.error(error: error.errorModel.message ?? ''));
    });
    // }
    // else {
    //   emit(BookState.error(error: 'No Internet Connection' ?? ''));
    // }
  }

  emituploadImageStates(File file) async {
    emit(const BookState.loading());
    //if(await internetChecher.isConnected){
    final response = await bookRepo.uploadFile(file, 'image');
    response.when(success: (img) {
      coverImageURL = img;
      //emit(BookState.success(book));
    }, failure: (error) {
      emit(BookState.error(error: error.errorModel.message ?? ''));
    });
    // }
    // else {
    //   emit(BookState.error(error: 'No Internet Connection' ?? ''));
    // }
  }

  emituploadBookPDFStates(File file) async {
    emit(const BookState.loading());
    //if(await internetChecher.isConnected){
    final response = await bookRepo.uploadFile(file, 'pdf');
    response.when(success: (pdf) {
      //emit(BookState.success(book));
      bookURL = pdf;
    }, failure: (error) {
      emit(BookState.error(error: error.errorModel.message ?? ''));
    });
    // }
    // else {
    //   emit(BookState.error(error: 'No Internet Connection' ?? ''));
    // }
  }

}