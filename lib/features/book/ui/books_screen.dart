import 'package:e_book_app/core/helpers/extensions.dart';
import 'package:e_book_app/core/routing/routes.dart';
import 'package:e_book_app/core/utils/config_size.dart';
import 'package:e_book_app/features/user/logic/user_cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/book_cubit.dart';
import '../logic/book_state.dart';

class BooksScreen extends StatefulWidget {
  const BooksScreen({Key? key}) : super(key: key);

  @override
  State<BooksScreen> createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  @override
  void initState() {
    BookCubit.get(context).emitGetAllBooksStates();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(context.read<BookCubit>().books);
    return Scaffold(
      body: BlocBuilder<BookCubit, BookState>(
        builder: (context, state) {
          var books = context.read<BookCubit>().books;
          return GridView.builder(
            itemCount: books.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    (ConfigSize.orientation == Orientation.portrait) ? 2 : 3),
            itemBuilder: (BuildContext context, int index) {
              return new Card(
                child: new GridTile(
                  footer: new Text(books[index].bookName),
                  child: new Text(books[index]
                      .authorName), //just for testing, will fill with image later
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: context.read<UserCubit>().user!.isAdmin! ?
          FloatingActionButton.extended(onPressed: (){
            context.pushNamed(Routes.addBookScreen);
          }, label: Text('Add Book')): const SizedBox(),
    );
  }
}
