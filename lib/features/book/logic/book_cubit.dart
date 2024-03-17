
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/models/book_model.dart';
import '../data/repo/book_repo.dart';
import 'book_state.dart';

class BookCubit extends Cubit<BookState> {
  //final InternetCheckerImpl internetChecher;
  final BookRepo bookRepo;

  BookCubit({ //required this.internetChecher,
    required this.bookRepo}) : super(const BookState.initial());

  static BookCubit get(context) => BlocProvider.of<BookCubit>(context);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController authorNameController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  Uint8List? coverImage;
  Uint8List? bookPDF;
  String coverImageURL = '';
  String bookURL = '';

  List<BookModel> books = [];
  emitGetAllBooksStates() async {
    emit(const BookState.loading());
    //if(await internetChecher.isConnected){
    final response = await bookRepo.getAllBooks();
    response.when(success: (bookList) {
      emit(BookState.success(bookList));
      books = bookList;
      print(books.toString());
    }, failure: (error) {
      emit(BookState.error(error: error.errorModel.message ?? ''));
    });
    // }
    // else {
    //   emit(BookState.error(error: 'No Internet Connection' ?? ''));
    // }
  }

  emitClearForm(){
    nameController.clear();
    authorNameController.clear();
    categoryController.clear();
    bookURL = '';
    coverImageURL = '';

  }
  emitaddBookStates() async {
    emit(const BookState.loading());
    //if(await internetChecher.isConnected){
    await emituploadImageStates();
    await emituploadBookPDFStates();
    final bookModel = BookModel(bookName: nameController.text, bookURL: bookURL, authorName: authorNameController.text, category: categoryController.text, coverImageURL: coverImageURL);
    final response = await bookRepo.addBook(bookModel);
    response.when(success: (book) {
      //emit(BookState.success(book));
      print(book.toString()+"dddddddddddddddddddddddddddddddddddd");
    }, failure: (error) {
      emit(BookState.error(error: error.errorModel.message ?? ''));
    });
    // }
    // else {
    //   emit(BookState.error(error: 'No Internet Connection' ?? ''));
    // }
  }

  emituploadImageStates() async {
    //emit(const BookState.loadingImage());
    //if(await internetChecher.isConnected){
    final response = await bookRepo.uploadFile(coverImage!, 'image');
    response.when(success: (img) {
      coverImageURL = img;
      print('ooooooooooooooooooooooooooooooooooooooo');
      //emit(BookState.loadedImage());
    }, failure: (error) {
      emit(BookState.error(error: error.errorModel.message ?? ''));
    });
    // }
    // else {
    //   emit(BookState.error(error: 'No Internet Connection' ?? ''));
    // }
  }

  emituploadBookPDFStates() async {
    //emit(const BookState.loadingPDF());
    //if(await internetChecher.isConnected){
    final response = await bookRepo.uploadFile(bookPDF!, 'pdf');
    response.when(success: (pdf) {
      //emit(BookState.loadedPDF());
      bookURL = pdf;
    }, failure: (error) {
      emit(BookState.error(error: error.errorModel.message ?? ''));
    });
    // }
    // else {
    //   emit(BookState.error(error: 'No Internet Connection' ?? ''));
    // }
  }
  getImageFromGallery() async {

    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['png,jpg'],
    );
    print(result);
    coverImage = result!.files.single.bytes!;
    /*final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    print(pickedFile.toString());
    coverImage = File(pickedFile!.path);*/
    await emituploadImageStates();
  }

  //Image Picker function to get image from camera
  getImageFromCamera() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['png,jpg'],
    );
    print(result);
    coverImage = result!.files.single.bytes!;
    // final pickedFile = await picker.pickImage(source: ImageSource.camera);
    // //print(pickedFile!.path.toString());
    //
    // // coverImage = File(pickedFile!.path);
    // // return pickedFile;


  }

  getBookPDF() async {
    emit(const BookState.loadingPDF());
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    print(result);
    bookPDF = result!.files.single.bytes!;
    emit(const BookState.loadedPDF());
  }

}