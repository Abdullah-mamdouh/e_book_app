
import 'package:e_book_app/core/utils/config_size.dart';
import 'package:e_book_app/core/widgets/bouncing_button.dart';
import 'package:e_book_app/features/book/logic/book_cubit.dart';
import 'package:e_book_app/features/book/logic/book_state.dart';
import 'package:e_book_app/features/book/ui/adding_book_screen/widgets/dot_border_image_widgt.dart';
import 'package:e_book_app/features/book/ui/adding_book_screen/widgets/image_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/app_text_form_field.dart';

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
      body: BlocListener<BookCubit, BookState>(
        listenWhen: (previous, current) =>
            current is Loading ||
            current is Success ||
            current is Error ||
            current is LoadingImage ||
            current is LoadingPDF,
        listener: (context, state) {
          state.whenOrNull(loadingImage: () {
            CircularProgressIndicator(
              color: Colors.red,
            );
            //StateHandler.setupErrorState(context, 'No Internet Connection');
          }, loadingPDF: () {
            CircularProgressIndicator(
              color: Colors.green,
            );
            //StateHandler.setupErrorState(context, 'No Internet Connection');
          }, loading: () {
            //debugPrint(_data[0].toString() + "adffffffffffffff");
          }, success: (data) {
            debugPrint(data.toString() + 'dsAAAAAAAAAA');
            context.read<BookCubit>().emitClearForm();
          });
        },
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                ImageWidget(),
                SizedBox(height: ConfigSize.defaultSize!*3,),
                DotBorderImageWidget(),
                SizedBox(height: ConfigSize.defaultSize!*3,),
                AppTextFormField(
                  hintText: 'Book Name',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a valid name';
                    }
                  },
                  controller: context.read<BookCubit>().nameController,
                ),
                SizedBox(height: ConfigSize.defaultSize!*2,),
                AppTextFormField(
                  hintText: 'Category',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a valid name';
                    }
                  },
                  controller: context.read<BookCubit>().categoryController,
                ),
                SizedBox(height: ConfigSize.defaultSize!*2,),
                AppTextFormField(
                  hintText: 'Author Name',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a valid name';
                    }
                  },
                  controller: context.read<BookCubit>().authorNameController,
                ),
                SizedBox(height: ConfigSize.defaultSize!*3,),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ConfigSize.defaultSize! * 2,
              vertical: ConfigSize.defaultSize! * 2),
          child: BouncingButton(
            child: Text(
              'Add Book',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
            onPress: () async {
              await context.read<BookCubit>().emitaddBookStates();
            },
          )),
    );
  }
}
