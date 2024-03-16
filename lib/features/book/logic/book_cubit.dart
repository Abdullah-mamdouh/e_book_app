

import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_web/image_picker_web.dart';

import '../data/models/book_model.dart';
import '../data/repo/book_repo.dart';
import 'book_state.dart';

class BookCubit extends Cubit<BookState> {
  //final InternetCheckerImpl internetChecher;
  final BookRepo bookRepo;

  BookCubit({ //required this.internetChecher,
    required this.bookRepo}) : super(const BookState.initial());

  static BookCubit get(context) => BlocProvider.of<BookCubit>(context);

  final TextEditingController authorName = TextEditingController();
  final TextEditingController category = TextEditingController();
  File? coverImage;
  Uint8List? bookPDF;
  String coverImageURL = '';
  String bookURL = '';

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

  emituploadImageStates() async {
    emit(const BookState.loading());
    //if(await internetChecher.isConnected){
    final response = await bookRepo.uploadImage(coverImage!, 'image');
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

  emituploadBookPDFStates() async {
    emit(const BookState.loading());
    //if(await internetChecher.isConnected){
    final response = await bookRepo.uploadFile(bookPDF!, 'pdf');
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

  static final picker = ImagePicker();
  final pickerWeb = ImagePickerWeb();

  getImageFromGallery() async {
    emit(const BookState.loading());
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    print(pickedFile.toString());
    coverImage = File(pickedFile!.path);
  }

  //Image Picker function to get image from camera
  getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    //print(pickedFile!.path.toString());

    coverImage = File(pickedFile!.path);
    // return pickedFile;


  }

  getBookPDF() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    print(result);
    bookPDF = result!.files.single.bytes!;
  }

}