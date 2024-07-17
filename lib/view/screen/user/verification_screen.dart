import 'dart:async';
import 'package:pinput/pinput.dart';
import 'package:event_app/view/screen/question/eventForm_screen.dart';
import 'package:event_app/view/theme/theme_color.dart';
import 'package:event_app/view/widgets/common.dart/custom_button.dart';
import 'package:event_app/view/widgets/common.dart/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

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

  String errorMessage = "";
  bool isSubmit = false;
  bool isDone = false;
  late FToast fToast;

  _showToast(String msg) {
    Widget toast = Container(
      height: 80,
      margin: const EdgeInsets.only(top: 80),
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.redAccent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.error_outline_outlined,
            color: Colors.white,
            size: 25,
          ),
          const SizedBox(
            width: 12.0,
          ),
          CustomText(
              text: msg,
              fontSize: 16,
              fontFamily: 'DMSans',
              align: TextAlign.center,
              alignment: Alignment.center,
              paddingLeft: 0,
              paddingRight: 0,
              fontWeight: FontWeight.w500,
              textColor: Colors.white),
        ],
      ),
    );
    fToast.showToast(
      child: toast,
      gravity: ToastGravity.CENTER,
      toastDuration: const Duration(seconds: 2),
    );
  }

  onSubmit() {
    if (pinController.text.length != 6) {
      errorMessage = 'Please fill in the OTP box!';
      _showToast(errorMessage);
    } else {
      setState(() {
        isSubmit = true;
      });
    }
  }

  onOkay() {
    setState(() {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => EventForm_screen()));
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

  late final TextEditingController pinController;
  late final FocusNode focusNode;
  late final GlobalKey<FormState> formKey;

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    pinController = TextEditingController();
    focusNode = FocusNode();
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

    fToast = FToast();
    // if you want to use context from globally instead of content we need to pass navigatorKey.currentContext!
    fToast.init(context);
  }

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  bool resend = false;
  _buildBody() {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    final defaultPinTheme = PinTheme(
      width: 42,
      height: 42,
      textStyle: const TextStyle(
        fontSize: 12,
        color: black,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: black),
      ),
    );
    return Container(
        height: screenHeight,
        width: screenWidth,
        padding: EdgeInsets.only(left: 15, right: 15),
        child: Column(
          children: [
            const SizedBox(
              height: 60,
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
            Directionality(
              // Specify direction if desired
              textDirection: TextDirection.ltr,
              child: Pinput(
                length: 6,
                controller: pinController,
                focusNode: focusNode,
                defaultPinTheme: defaultPinTheme,
                separatorBuilder: (index) => const SizedBox(width: 8),
                validator: (value) {
                  return null;
                  // return secondsRemaining == 0 ? null : 'Pin is incorrect';
                },
                hapticFeedbackType: HapticFeedbackType.lightImpact,
                onCompleted: (pin) {
                  debugPrint('onCompleted: $pin');
                },
                onChanged: (value) {
                  debugPrint('onChanged: $value');
                  setState(() {
                    if (secondsRemaining == 0) {
                      resend = true;
                    }
                  });
                },
                showCursor: true,
                cursor: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 4),
                      width: 22,
                      height: 1,
                      color: primary,
                    ),
                  ],
                ),
                focusedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: black),
                  ),
                ),
                submittedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: primary),
                  ),
                ),
                errorPinTheme: defaultPinTheme.copyBorderWith(
                  border: Border.all(color: Colors.redAccent),
                ),
              ),
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
            CustomText(
                text: 'Resend',
                fontSize: 12,
                fontFamily: 'DMSans',
                align: TextAlign.center,
                alignment: Alignment.center,
                fontWeight: FontWeight.w400,
                paddingLeft: 0,
                paddingRight: 0,
                textColor: resend == true ? primary : ActiveColor),
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
              onPressed: isDone == false ? onDone : onOkay,
              fontFamily: 'DMSans',
              buttonWidth: screenWidth * 2 / 3,
              fontSize: 16,
              isText: true,
            ),
          ],
        ));
  }
}
