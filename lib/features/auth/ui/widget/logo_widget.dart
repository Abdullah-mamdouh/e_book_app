
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.symmetric(vertical: 0.0),
      height: MediaQuery.of(context).size.height *0.30.h,
      width: double.infinity,
      child: Image.asset("assets/images/books.gif"),
    );
  }
}
