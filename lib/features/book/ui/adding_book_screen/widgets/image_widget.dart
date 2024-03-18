import 'package:e_book_app/features/book/logic/book_cubit.dart';
import 'package:e_book_app/features/book/logic/book_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/methods_widget.dart';

class ImageWidget extends StatefulWidget {
  const ImageWidget({Key? key}) : super(key: key);

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookCubit, BookState>(
      builder: (context, state) {
        return Center(
          child: SizedBox(
            height: 120,
            width: 120,
            child: Stack(
              clipBehavior: Clip.none,
              fit: StackFit.expand,
              children: [
                context.read<BookCubit>().coverImage != null
                    ? Container(
                  decoration: BoxDecoration(shape: BoxShape.rectangle,image: DecorationImage(fit: BoxFit.fill,image: MemoryImage(context.read<BookCubit>().coverImage!))),
                )
                    : Image.asset('assets/images/cover.png'),
                Positioned(
                    bottom: 0,
                    right: -25,
                    child: RawMaterialButton(
                      onPressed: () async {
                        Methods.showImageCoverOptions(context);},
                      elevation: 2.0,
                      fillColor: Color(0xFF8fd469),
                      padding: EdgeInsets.all(5.0),
                      shape: CircleBorder(),
                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 18,
                      ),
                    )),
              ],
            ),
          ),
        );
      },
    );
  }
}
