import 'package:e_book_app/core/helpers/extensions.dart';
import 'package:e_book_app/core/routing/routes.dart';
import 'package:e_book_app/core/utils/config_size.dart';
import 'package:e_book_app/features/book/ui/books_screen/widgets/book_card_widget.dart';
import 'package:e_book_app/features/user/logic/user_cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/book_cubit.dart';
import '../../logic/book_state.dart';

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
              crossAxisCount: 2, // number of items in each row
              mainAxisSpacing: 15.0, // spacing between rows
              crossAxisSpacing: 15.0, // spacing between columns
            ),
                  //  (ConfigSize.orientation == Orientation.portrait) ? 2 : 3),
            itemBuilder: (BuildContext context, int index) {
              return
                BookCardWidget(bookModel: books[index]);
            },
          );
        },
      ),
      floatingActionButton: context.read<UserCubit>().user!.isAdmin!
          ? Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    context.pushNamed(Routes.activeUserScreen);
                  },
                  child: Image.asset("assets/images/active_user.png",),
                  tooltip: 'Active Users',
                ),
                SizedBox(
                  height: ConfigSize.defaultSize! * 2,
                ),
                FloatingActionButton(
                  onPressed: () {
                    context.pushNamed(Routes.addBookScreen);
                  },
                  child: Image.asset("assets/images/add_book.png",),
                  tooltip: 'Adding Book',
                ),
              ],
            )
          : const SizedBox(),
    );
  }
}
