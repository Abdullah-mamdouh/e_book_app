

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';

class HalfCircleWidget extends StatelessWidget {
  const HalfCircleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Positioned(
      top: 80.h,
      right: -50.w,
      child: CircleAvatar(
        backgroundColor: ColorsManager.mainColor,
        radius: 50.sp,
      ),
    );
  }
}
