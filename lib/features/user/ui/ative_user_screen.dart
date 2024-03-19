
import 'package:e_book_app/features/user/ui/widgets/slide_fade_animation.dart';
import 'package:e_book_app/features/user/ui/widgets/user_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/config_size.dart';
import '../logic/user_cubit/user_cubit.dart';
import '../logic/user_cubit/user_state.dart';

class ActiveUserScreen extends StatefulWidget {
  const ActiveUserScreen({Key? key}) : super(key: key);

  @override
  State<ActiveUserScreen> createState() => _ActiveUserScreenState();
}

class _ActiveUserScreenState extends State<ActiveUserScreen> {
  
  @override
  void initState() {
    super.initState();
    UserCubit.get(context).emitGetAllUsersStates();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          var users = UserCubit.users;
          return ListView.builder(
            itemCount: users.length,
           itemBuilder: (BuildContext context, int index) {
              return SlideFadeAnimation(
                  index: index,
                  animationDuration: 1000,
                  verticalOffset: 200,
                  child: UserCardWidget(
                    user: users[index],
                  ),
              );
            },
          );
        },
      ),
    );
  }
}
