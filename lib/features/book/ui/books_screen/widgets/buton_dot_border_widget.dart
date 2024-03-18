
import 'package:dotted_border/dotted_border.dart';
import 'package:e_book_app/core/helpers/extensions.dart';
import 'package:e_book_app/core/routing/routes.dart';
import 'package:e_book_app/core/theming/colors.dart';
import 'package:flutter/material.dart';

class ButtonDotBorderWidget extends StatefulWidget {
  ButtonDotBorderWidget({Key? key, required this.label, required this.onClick}) : super(key: key);
  String label;
  final Function onClick;
  @override
  State<ButtonDotBorderWidget> createState() => _ButtonDotBorderWidgetState();
}

class _ButtonDotBorderWidgetState extends State<ButtonDotBorderWidget> {
  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      borderType: BorderType.RRect,
      dashPattern: [8, 4],
      strokeWidth: 2,
      color: ColorsManager.darkColor,
      radius: Radius.circular(2),
      padding: EdgeInsets.all(6),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(2)),
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          onPressed: (){
            widget.onClick();
          },
          child: Text(
            '${widget.label}',
            style: TextStyle(
                color:ColorsManager.mainColor,
                fontSize: 14,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
