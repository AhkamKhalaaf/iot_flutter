import 'package:flutter/material.dart';

class ButtonUi extends StatelessWidget {
  final double w;
  final double padding;
  final Widget widget;
  final Color backColor;
  final Color borderColor;

  const ButtonUi(
      {Key? key,
      required this.w,
      required this.padding,
      required this.widget,
      required this.backColor,
      required this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: backColor,
            border: Border.all(width: 1.0, color: borderColor)),
        padding: EdgeInsets.all(padding),
        alignment: Alignment.center,
        width: w,
        child: widget);
  }
}
