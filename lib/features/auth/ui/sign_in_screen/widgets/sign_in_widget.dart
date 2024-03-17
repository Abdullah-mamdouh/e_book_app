
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../core/widgets/bouncing_button.dart';
import '../../../../user/logic/user_cubit/user_cubit.dart';
import '../../../logic/sign_in_cubit/sign_in_cubit.dart';
import '../../widget/carve_widget.dart';
import '../../widget/half_circle_widget.dart';
import '../../widget/logo_widget.dart';
import '../../widget/title_widget.dart';
import 'dont_have_account_text.dart';
import 'email_and_password.dart';
import 'login_bloc_listener.dart';
import 'terms_and_conditions_text.dart';

class SigninWidget extends StatelessWidget {
  const SigninWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:  Container(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            CarveWidget(),
            HalfCircleWidget(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //SizedBox(height:55 ,),
                verticalSpace(80),
                TitleWidget(title: 'Welocome Back',),
                verticalSpace(15.h),
                LogoWidget(),
                Padding(
                  padding: EdgeInsets.symmetric(vertical:20.h, horizontal: 20.0.w),
                  child: Column(
                    children: [
                      const EmailAndPassword(),
                      verticalSpace(24),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Text(
                          'Forgot Password?',
                          style: TextStyles.font13GrayRegular,
                        ),
                      ),
                      verticalSpace(40),
                      BouncingButton(child: Text('Login', style: TextStyles.font13DarkBlueMedium,),//height: 55.h,
                        onPress: () {
                          validateThenDoLogin(context);
                        },),

                      verticalSpace(16),
                      const TermsAndConditionsText(),
                      verticalSpace(40),
                      const DontHaveAccountText(),
                      const LoginBlocListener(),
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

  void validateThenDoLogin(BuildContext context) async{
    if (context.read<SignInCubit>().formKey.currentState!.validate()) {
      context.read<SignInCubit>().emitSignInStates();
    }
  }
}