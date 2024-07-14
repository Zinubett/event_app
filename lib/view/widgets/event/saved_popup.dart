import 'package:event_app/view/screen/Event/saves.dart';
import 'package:event_app/view/theme/theme_color.dart';
import 'package:event_app/view/widgets/common.dart/custom_button.dart';
import 'package:event_app/view/widgets/common.dart/custom_text.dart';
import 'package:flutter/material.dart';

class Saved_popup extends StatefulWidget {
  @override
  _Saved_popupState createState() => _Saved_popupState();
}

class _Saved_popupState extends State<Saved_popup> {
  getResult() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Saves_screen()));
  }

  cancel() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Container(
          margin: const EdgeInsets.only(
            left: 15,
            right: 15,
          ),
          height: 48,
          width: 48,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                "images/pinkSaved.png",
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const CustomText(
            text: 'Successfully Saved',
            fontSize: 16,
            fontFamily: 'DMSans',
            align: TextAlign.center,
            alignment: Alignment.center,
            paddingLeft: 0,
            paddingRight: 0,
            fontWeight: FontWeight.w400,
            textColor: black),
        const SizedBox(
          height: 15,
        ),
        const CustomText(
            text: 'You have successfully saved the event',
            fontSize: 12,
            fontFamily: 'DMSans',
            align: TextAlign.center,
            alignment: Alignment.center,
            paddingLeft: 0,
            paddingRight: 0,
            fontWeight: FontWeight.w400,
            textColor: black),
        const SizedBox(
          height: 30,
        ),
        SizedBox(
          height: 36,
          child: Row(
            children: [
              Expanded(
                  child: CustomButton(
                text: 'Cancel',
                imageUrl: "",
                buttonColor: black,
                textColor: Colors.white,
                onPressed: cancel,
                fontFamily: 'DMSans',
                buttonWidth: double.infinity,
                fontSize: 12,
                isText: true,
              )),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                flex: 2,
                child: CustomButton(
                  text: 'View Results',
                  imageUrl: "",
                  buttonColor: primary,
                  textColor: Colors.white,
                  onPressed: getResult,
                  fontFamily: 'DMSans',
                  buttonWidth: double.infinity,
                  fontSize: 12,
                  isText: true,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
