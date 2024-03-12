
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/widgets/bouncing_button.dart';
import '../../../logic/sign-up_cubit/sign_up_cubit.dart';
import '../../sign_in_screen/widgets/terms_and_conditions_text.dart';
import '../../widget/carve_widget.dart';
import '../../widget/half_circle_widget.dart';
import '../../widget/logo_widget.dart';
import '../../widget/title_widget.dart';
import 'already_have_account_text.dart';
import 'sign_up_bloc_listener.dart';
import 'sign_up_form.dart';

class SignupWidget extends StatelessWidget {
  const SignupWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            CarveWidget(),
            HalfCircleWidget(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //SizedBox(height:55 ,),
                verticalSpace(60),
                TitleWidget(title: 'Welocome'),
                verticalSpace(15),
                LogoWidget(),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 20.h, horizontal: 20.0.w),
                  child: Column(
                    children: [
                      const SignupForm(),
                      verticalSpace(40),
                      BouncingButton(
                        child: Text("Create Account"),
                        onPress: () {
                          validateThenDoSignup(context);
                        },
                      ),
                      verticalSpace(16),
                      const TermsAndConditionsText(),
                      verticalSpace(30),
                      const AlreadyHaveAccountText(),
                      const SignupBlocListener(),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  void validateThenDoSignup(BuildContext context) {
    if (context.read<SignupCubit>().formKey.currentState!.validate()) {
      context.read<SignupCubit>().emitSignupStates();
    }
  }
}
