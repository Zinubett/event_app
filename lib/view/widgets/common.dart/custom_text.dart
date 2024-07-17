import 'package:flutter/material.dart';

class CustomText extends StatefulWidget {
  final String text;
  final double fontSize;
  final String fontFamily;
  final double paddingLeft;
  final double paddingRight;
  final Alignment alignment;
  final FontWeight fontWeight;
  final TextAlign align;
  final Color textColor;
  const CustomText(
      {required this.text,
      required this.fontSize,
      required this.fontFamily,
      required this.align,
      required this.alignment,
      required this.paddingLeft,
      required this.paddingRight,
      required this.fontWeight,
      required this.textColor});
  @override
  _CustomTextState createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: widget.alignment,
      padding:
          EdgeInsets.only(left: widget.paddingLeft, right: widget.paddingRight),
      child: Text(widget.text,
          maxLines: 10,
          textAlign: widget.align,
          style: TextStyle(
              fontSize: widget.fontSize,
              color: widget.textColor,
              fontFamily: widget.fontFamily,
              fontWeight: widget.fontWeight,
              height: 1)),
    );
  }
}
