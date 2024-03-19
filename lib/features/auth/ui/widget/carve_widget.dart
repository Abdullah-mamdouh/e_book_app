
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';

class CarveWidget extends StatelessWidget {
  const CarveWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Positioned(
      top: -80.h,
      left: -85.w,
      child: CircleAvatar(
        backgroundColor: ColorsManager.mainColor.withOpacity(0.4),
        radius: 100.sp,
      ),
    );
  }
}
