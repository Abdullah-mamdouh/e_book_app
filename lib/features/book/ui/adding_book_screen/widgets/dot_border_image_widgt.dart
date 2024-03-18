
import 'package:dotted_border/dotted_border.dart';
import 'package:e_book_app/features/book/logic/book_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/book_cubit.dart';

class DotBorderImageWidget extends StatefulWidget {
  const DotBorderImageWidget({Key? key}) : super(key: key);

  @override
  State<DotBorderImageWidget> createState() => _DotBorderImageWidgetState();
}

class _DotBorderImageWidgetState extends State<DotBorderImageWidget> {
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<BookCubit, BookState>(builder: (context, state) {
      return DottedBorder(
        borderType: BorderType.RRect,
        dashPattern: [8, 4],
        strokeWidth: 2,
        color: Colors.orange,
        radius: Radius.circular(8),
        padding: EdgeInsets.all(6),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          child: Container(

            child: Padding(
              padding: EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 85,
                    width: 95,
                    child: Stack(
                      clipBehavior: Clip.none,
                      fit: StackFit.expand,
                      children: [
                        Container(
                          height: 85,
                          width: 95,
                          color: Colors.blueGrey,
                          child: const Icon(
                            Icons.file_copy,
                            color: Colors.blueAccent,
                            size: 50,
                          ),
                        ),
                        Positioned(
                          top: -20,
                          right: -45,
                          child: RawMaterialButton(
                            onPressed: () async {
                              await context.read<BookCubit>().getBookPDF();
                            },
                            elevation: 2.0,
                            fillColor: Colors.deepOrangeAccent,
                            padding: EdgeInsets.all(5.0),
                            shape: CircleBorder(),
                            child: const Icon(
                              Icons.add,
                              color: Colors.teal,
                              size: 25,
                            ),),),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Text(
                      context.read<BookCubit>().bookPDF == null ? "Upload Your Book ": 'Your Book is Uploaded',
                      style: TextStyle(
                        // fontWeight: FontWeight500,
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },);
  }
}
