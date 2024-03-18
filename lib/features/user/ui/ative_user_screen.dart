
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
          return GridView.builder(
            itemCount: users.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                (ConfigSize.orientation == Orientation.portrait) ? 2 : 3),
            itemBuilder: (BuildContext context, int index) {
              return UserCardWidget(user: users[index]);
                /*new Card(
                child: new GridTile(
                  footer: new Text(users[index].name!),
                  child: new MaterialButton(onPressed: ()async{
                    await context.read<UserCubit>().emitupdateUserStates(users[index]);
                  }, child: Text('Not Active'),), //just for testing, will fill with image later
                ),
              );*/
            },
          );
        },
      ),
    );
  }
}
