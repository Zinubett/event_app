import 'package:flutter/material.dart';

class CustomText extends StatefulWidget {
  final String text;
  final double fontSize;
  final String fontFamily;
  final double paddingLeft;
  final double paddingRight;
  final TextAlign align;
  const CustomText(
      {required this.text,
      required this.fontSize,
      required this.fontFamily,
      required this.align,
      required this.paddingLeft,
      required this.paddingRight});
  @override
  _CustomTextState createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding:
          EdgeInsets.only(left: widget.paddingLeft, right: widget.paddingRight),
      child: Text(widget.text,
          maxLines: 3,
          textAlign: widget.align,
          style: TextStyle(
              fontSize: widget.fontSize,
              color: Colors.white,
              fontFamily: widget.fontFamily,
              height: 1)),
    );
  }
}
