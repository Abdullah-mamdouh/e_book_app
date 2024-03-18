import 'package:e_book_app/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/widgets/indicator_widget.dart';
import '../../../../../core/widgets/state_handler_widget.dart';
import '../../../../user/logic/user_cubit/user_cubit.dart';
import '../../../logic/sign_in_cubit/sign_in_cubit.dart';
import '../../../logic/sign_in_cubit/sign_in_state.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInCubit, SignInState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) => const IndicatorWidget(),
            );
          },
          success: (loginResponse) async{
            context.pop();
            await context.read<UserCubit>().emitGetUserStates(loginResponse);
            context.pushNamed(Routes.booksScreen);
            // NotificationCubit.get(context).emitSendNotification();
          },
          error: (error) {
            StateHandler.setupErrorState(context, error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

}
