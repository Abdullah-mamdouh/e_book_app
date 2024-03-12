
import 'package:flutter/material.dart';

import '../theming/colors.dart';

class IndicatorWidget extends StatelessWidget {
  const IndicatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      child: const Center(
        child: CircularProgressIndicator(color: ColorsManager.mainColor,),),
      maintainSize: true,
      maintainAnimation: true,
      maintainState: true,
      visible: true,
    );
  }
}
