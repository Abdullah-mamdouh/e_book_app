
import 'package:e_book_app/core/helpers/extensions.dart';
import 'package:e_book_app/core/theming/colors.dart';
import 'package:e_book_app/core/utils/config_size.dart';
import 'package:e_book_app/features/book/data/models/book_model.dart';
import 'package:e_book_app/features/book/ui/books_screen/widgets/buton_dot_border_widget.dart';
import 'package:e_book_app/features/book/ui/widgets/methods_widget.dart';
import 'package:e_book_app/features/user/logic/user_cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/routing/routes.dart';

class BookCardWidget extends StatelessWidget {
  BookCardWidget({Key? key, required this.bookModel}) : super(key: key);
  BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Container(

      padding: const EdgeInsets.only(right: 8,left: 8,top: 10),
      height: MediaQuery.of(context).size.height*0.5,
      // width: ConfigSize.screenWidth!*0.4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage('${bookModel.coverImageURL}'),//AssetImage('assets/images/real/coffee.png'),
                        // fit: BoxFit.fill,
                      )
                  ),
                ),
              ),
              // SizedBox(height: ConfigSize.defaultSize!*2,),

              IconButton(icon: Icon(Icons.delete,size: 20), color: Colors.red, onPressed: (){},),
            ],
          ),
          SizedBox(height: ConfigSize.defaultSize!*2,),
          Text(
            '${bookModel.bookName}',
            maxLines: 2,overflow: TextOverflow.fade,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: ColorsManager.kProgressIndicator),
          ),
          SizedBox(height: ConfigSize.defaultSize!*1,),
          Container(
            // width:100,
            height: 32,
            child: ButtonDotBorderWidget(label: 'READ', onClick: () {
              // context.pushNamed(Routes.pdfViewScreen, arguments: bookModel.bookURL);
              context.read<UserCubit>().user!.isActive! ?
              context.pushNamed(Routes.pdfViewScreen, arguments: bookModel.bookURL) : Methods.showAccountNotActiveDialog(context);
            }),
          )
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.25),
            offset: Offset(0, 1.0),
            blurRadius: 4.0,
            spreadRadius: 1, // Shadow position
          ),
        ],
      ),
    );
  }
}
