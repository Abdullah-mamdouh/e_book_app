import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/app_regex.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/widgets/app_text_form_field.dart';
import '../../../logic/sign-up_cubit/sign_up_cubit.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  bool isPasswordObscureText = true;
  bool isPasswordConfirmationObscureText = true;

  // bool hasLowercase = false;
  // bool hasUppercase = false;
  // bool hasSpecialCharacters = false;
  // bool hasNumber = false;
  // bool hasMinLength = false;

  // late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    // passwordController = context.read<SignupCubit>().passwordController;
    // setupPasswordControllerListener();
  }

  /*void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowerCase(passwordController.text);
        hasUppercase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters =
            AppRegex.hasSpecialCharacter(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignupCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'Name',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid name';
              }
            },
            controller: context.read<SignupCubit>().nameController,
          ),
          // verticalSpace(18),
          verticalSpace(18),
          AppTextFormField(
            hintText: 'Email',
            validator: (value) {
              if (value != null && !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
            },
            controller: context.read<SignupCubit>().emailController,
          ),
          verticalSpace(18),
          AppTextFormField(
            controller: context.read<SignupCubit>().passwordController,
            hintText: 'Password',
            isObscureText: isPasswordObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordObscureText = !isPasswordObscureText;
                });
              },
              child: Icon(
                isPasswordObscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
            validator: (value) {
              // if (value != null && !AppRegex.isPasswordValid(value)) {
              //   return 'Please enter a valid password';
              // }
            },
          ),
          verticalSpace(18),
          AppTextFormField(
            controller:
                context.read<SignupCubit>().passwordConfirmationController,
            hintText: 'Password Confirmation',
            isObscureText: isPasswordConfirmationObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordConfirmationObscureText =
                      !isPasswordConfirmationObscureText;
                });
              },
              child: Icon(
                isPasswordConfirmationObscureText
                    ? Icons.visibility_off
                    : Icons.visibility,
              ),
            ),
            validator: (value) {
              if ((context
                          .read<SignupCubit>()
                          .passwordConfirmationController
                          .text)
                      .compareTo(context
                          .read<SignupCubit>()
                          .passwordController
                          .text) != 0) {
                return 'Please enter the same password';
              }
            },
          ),

          /*PasswordValidations(
            hasLowerCase: hasLowercase,
            hasUpperCase: hasUppercase,
            hasSpecialCharacters: hasSpecialCharacters,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,
          ),*/
        ],
      ),
    );
  }

  // @override
  // void dispose() {
  //   passwordController.dispose();
  //   super.dispose();
  // }
}
