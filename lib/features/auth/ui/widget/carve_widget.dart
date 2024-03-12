
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/colors.dart';

class CarveWidget extends StatelessWidget {
  const CarveWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Positioned(
      top: 0,
      left: 0,
      child: Image.asset(
        'images/signin_top.png',
        width: 140.w,
        color: ColorsManager.mainColor,
      ),
    );
  }
}
