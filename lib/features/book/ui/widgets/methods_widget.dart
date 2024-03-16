

 import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_picker_web/image_picker_web.dart';

import '../../logic/book_cubit.dart';

class Methods {
  static final picker = ImagePicker();
  final pickerWeb = ImagePickerWeb();
  static Future<void> showImageCoverOptions(BuildContext context,) async {
     showCupertinoModalPopup(
       context: context,
       builder: (context) => CupertinoActionSheet(
         actions: [
           CupertinoActionSheetAction(
             child: Text('Photo Gallery'),
             onPressed: () async{
               // close the options modal
               Navigator.of(context).pop();
               // get image from gallery
               await context.read<BookCubit>().getImageFromGallery();
             },
           ),
           CupertinoActionSheetAction(
             child: Text('Camera'),
             onPressed: () async{
               // close the options modal
               Navigator.of(context).pop();
               // get image from camera
               await context.read<BookCubit>().getImageFromCamera();
             },
           ),
         ],
       ),
     );
   }

}