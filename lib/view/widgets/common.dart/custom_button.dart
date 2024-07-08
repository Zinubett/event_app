import 'package:event_app/view/widgets/common.dart/custom_text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final double fontSize;
  final String fontFamily;
  final bool isText;
  final String imageUrl;
  final Color buttonColor;
  final Color textColor;
  final double buttonWidth;
  final Function() onPressed;

  const CustomButton(
      {required this.text,
      required this.fontSize,
      required this.fontFamily,
      required this.isText,
      required this.buttonWidth,
      required this.imageUrl,
      required this.buttonColor,
      required this.textColor,
      required this.onPressed});
  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: widget.buttonWidth,
      child: TextButton(
          style: ButtonStyle(
              padding:
                  MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
              backgroundColor:
                  MaterialStateProperty.all<Color>(widget.buttonColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                side: BorderSide(color: Colors.black45, width: 1.5),
                borderRadius: BorderRadius.circular(10.0),
              ))),
          onPressed: () {
            widget.onPressed();
          },
          child: widget.isText == true
              ? CustomText(
                  text: widget.text,
                  alignment: Alignment.center,
                  textColor: widget.textColor,
                  fontSize: widget.fontSize,
                  fontFamily: 'DMSans',
                  fontWeight: FontWeight.w400,
                  align: TextAlign.center,
                  paddingLeft: 0,
                  paddingRight: 0,
                )
              : Image.asset(
                  widget.imageUrl,
                  width: 15,
                  height: 15,
                )),
    );
  }
}
