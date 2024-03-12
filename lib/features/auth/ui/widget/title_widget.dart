
import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  TitleWidget({Key? key, required this.title}) : super(key: key);
  String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 28,fontWeight: FontWeight.w900,
        //color: Colors.white
      ),
    );
  }
}
