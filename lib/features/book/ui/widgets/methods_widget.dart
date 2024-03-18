
import 'package:e_book_app/core/helpers/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/book_cubit.dart';

class Methods{
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

  static void showAccountNotActiveDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Account is Not Active'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Please Wait until Admin active your Account'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              style: TextButton.styleFrom(
                primary: Colors.white,
                backgroundColor: Colors.blue,
                onSurface: Colors.grey,
              ),
              onPressed: () {
                context.pop();
              },
            ),
          ],
        );
      },
    );
  }

}