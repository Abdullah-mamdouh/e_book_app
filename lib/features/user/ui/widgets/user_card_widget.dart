import 'dart:math';

import 'package:e_book_app/core/utils/config_size.dart';
import 'package:e_book_app/core/widgets/bouncing_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../data/models/user_model.dart';
import '../../logic/user_cubit/user_cubit.dart';

class UserCardWidget extends StatelessWidget {
  UserCardWidget({Key? key,required this.user}) : super(key: key);
  UserModel user;
  @override
  Widget build(BuildContext context) {
    int userImage = Random().nextInt(5) + 1;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
      decoration: BoxDecoration(
          color: ColorsManager.mainColor.withOpacity(0.8),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: ColorsManager.mainColor, width: 0.2)),
      padding: EdgeInsets.all(10.sp),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(90.sp),
            child: Image(
              image: AssetImage('assets/images/user${userImage}.png'),
              fit: BoxFit.cover,
              height: 100.h,
              width: 70.w,
            ),
          ),
          horizontalSpace(5),

          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          user.name.toString(),
                          maxLines: 1,
                          softWrap: true,
                          overflow: TextOverflow.fade,
                          style: TextStyles.font24BlackBold,
                        ),

                      ),
                      BouncingButton(width: 100.w,child: Text("Active"), onPress: (){
                        context.read<UserCubit>().emitupdateUserStates(user);
                      })
                    ],
                  ),
                  verticalSpace(10),
                  Text(
                    ' ${user.email}',
                    style: TextStyles.font13DarkBlueMedium,
                  ),

                ],
              ))
        ],
      ),
    );
  }
}
