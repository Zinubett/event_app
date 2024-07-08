import 'dart:async';

import 'package:event_app/view/screen/user/signUp_screen.dart';
import 'package:event_app/view/theme/theme_color.dart';
import 'package:event_app/view/widgets/common.dart/custom_button.dart';
import 'package:event_app/view/widgets/common.dart/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';

class Verification_screen extends StatefulWidget {
  @override
  _Verification_screenState createState() => _Verification_screenState();
}

class _Verification_screenState extends State<Verification_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: isSubmit == false ? _buildBody() : congrats(),
    );
  }

  bool isSubmit = false;
  bool isDone = false;
  onSubmit() {
    setState(() {
      isSubmit = true;
    });
  }

  onDone() {
    setState(() {
      isDone = true;
    });
  }

  bool _onEditing = true;
  String? _code;
  int secondsRemaining = 30;
  bool enableResend = false;
  late Timer timer;

  @override
  initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (secondsRemaining != 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        setState(() {
          enableResend = true;
        });
      }
    });
  }

  _buildBody() {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
        height: screenHeight,
        width: screenWidth,
        padding: EdgeInsets.only(left: 15, right: 15),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            const CustomText(
                text: 'Verification',
                alignment: Alignment.centerLeft,
                fontWeight: FontWeight.w500,
                textColor: black,
                fontSize: 32,
                fontFamily: 'DMSans',
                align: TextAlign.start,
                paddingLeft: 0,
                paddingRight: 40),
            const SizedBox(
              height: 10,
            ),
            const CustomText(
                text: 'Type the code you received on your email to verify.',
                textColor: black,
                alignment: Alignment.centerLeft,
                fontWeight: FontWeight.w400,
                fontSize: 14,
                fontFamily: 'DMSans',
                align: TextAlign.start,
                paddingLeft: 0,
                paddingRight: 40),
            const SizedBox(
              height: 60,
            ),
            VerificationCode(
              itemSize: 40,
              underlineWidth: 1,
              padding: EdgeInsets.all(4),
              digitsOnly: true,
              fullBorder: true,
              cursorColor: primary,
              autofocus: true,
              textStyle:
                  Theme.of(context).textTheme.bodyText2!.copyWith(color: black),
              keyboardType: TextInputType.number,
              underlineColor: primary,
              length: 6,
              margin: const EdgeInsets.all(2),
              onCompleted: (String value) {
                setState(() {
                  _code = value;
                });
              },
              onEditing: (bool value) {
                setState(() {
                  _onEditing = value;
                });
                if (!_onEditing) FocusScope.of(context).unfocus();
              },
            ),
            const SizedBox(
              height: 20,
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'In ',
                style: const TextStyle(
                    fontSize: 12,
                    color: black,
                    fontFamily: 'DMSans',
                    height: 1),
                children: <TextSpan>[
                  TextSpan(
                    text: '$secondsRemaining',
                    style: const TextStyle(
                        fontSize: 12,
                        color: primary,
                        fontFamily: 'DMSans',
                        height: 1),
                  ),
                  const TextSpan(
                    text: ' seconds another code can be resend',
                    style: TextStyle(
                        fontSize: 12,
                        color: black,
                        fontFamily: 'DMSans',
                        height: 1),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            CustomButton(
              text: 'Submit',
              imageUrl: "",
              buttonColor: primary,
              textColor: Colors.white,
              onPressed: onSubmit,
              fontFamily: 'DMSans',
              buttonWidth: screenWidth * 2 / 3,
              fontSize: 16,
              isText: true,
            ),
            const SizedBox(
              height: 40,
            ),
            const CustomText(
                text: 'Resend',
                fontSize: 12,
                fontFamily: 'DMSans',
                align: TextAlign.center,
                alignment: Alignment.center,
                fontWeight: FontWeight.w400,
                paddingLeft: 0,
                paddingRight: 0,
                textColor: primary),
          ],
        ));
  }

  Widget congrats() {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
        padding: EdgeInsets.only(left: 15, right: 15),
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 1 / 4,
            ),
            Image(
              image: isDone == false
                  ? AssetImage("images/Successmark.png")
                  : AssetImage("images/Frame.png"),
              width: 200,
              height: 200,
            ),
            const SizedBox(
              height: 40,
            ),
            CustomText(
                text: isDone == false ? 'Congratulations!' : 'Welcome!',
                alignment: Alignment.center,
                fontWeight: FontWeight.w500,
                textColor: primary,
                fontSize: 24,
                fontFamily: 'DMSans',
                align: TextAlign.center,
                paddingLeft: 0,
                paddingRight: 0),
            SizedBox(
              height: 10,
            ),
            CustomText(
                text: isDone == false
                    ? 'Your email has been verified, you can now start'
                    : 'Thanks for downloading our app! We’re actively working on enhancing our functionality in these early stages. You’re among the first users and we appreciate any feedback you have.',
                alignment: Alignment.center,
                fontWeight: FontWeight.w400,
                textColor: black,
                fontSize: 14,
                fontFamily: 'DMSans',
                align: TextAlign.center,
                paddingLeft: isDone == false ? 65 : 0,
                paddingRight: isDone == false ? 65 : 0),
            const SizedBox(
              height: 35,
            ),
            CustomButton(
              text: isDone == false ? 'Done' : 'Okay',
              imageUrl: "",
              buttonColor: primary,
              textColor: Colors.white,
              onPressed: onDone,
              fontFamily: 'DMSans',
              buttonWidth: screenWidth * 2 / 3,
              fontSize: 16,
              isText: true,
            ),
          ],
        ));
  }
}
