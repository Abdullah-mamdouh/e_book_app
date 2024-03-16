
import 'dart:io';

import 'package:e_book_app/core/theming/colors.dart';
import 'package:e_book_app/features/book/logic/book_cubit.dart';
import 'package:e_book_app/features/book/ui/widgets/methods_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker_web/image_picker_web.dart';

import '../../../core/widgets/app_text_form_field.dart';
import '../../auth/logic/sign-up_cubit/sign_up_cubit.dart';

class AddingBook extends StatefulWidget {
  const AddingBook({Key? key}) : super(key: key);

  @override
  State<AddingBook> createState() => _AddingBookState();
}

class _AddingBookState extends State<AddingBook> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: constantColors.blackLight2,
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios,
          ),
        ),
        title: Text(
          'Employees'.toString(),
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(50),
          ),
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          AppTextFormField(
            hintText: 'Book Name',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid name';
              }
            },
            //controller: ,
          ),
          AppTextFormField(
            hintText: 'Category',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid name';
              }
            },
            //controller: context.read<SignupCubit>().nameController,
          ),
          Row(
            children: [
              MaterialButton(
                height: 52,
                //minWidth: Helper.getScreenWidth(context) * 0.44,
                padding: EdgeInsets.symmetric(vertical: 14),
                onPressed: () async{
                  Methods.showImageCoverOptions(context);
                  // if(kIsWeb){
                  //   print((await ImagePickerWeb.getImageAsWidget().)..toString()).;
                  // }

                  //File fromPicker = File.readAsBytes().(await ImagePickerWeb.getImageAsBytes()) as File;
                  //print(fromPicker.toString());
                 // await context.read<BookCubit>().emituploadImageStates();
                },
                color: ColorsManager.darkBlue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                child: const Text(
                  'Cover Image Book',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),

              MaterialButton(
                height: 52,
                //minWidth: Helper.getScreenWidth(context) * 0.44,
                padding: EdgeInsets.symmetric(vertical: 14),
                onPressed: () async{
                  await context.read<BookCubit>().getBookPDF();
                },
                color: ColorsManager.darkBlue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                child: const Text(
                  'Book PDF',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }

}
