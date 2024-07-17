import 'dart:async';
import 'package:event_app/controller/user/verification_controller.dart';
import 'package:event_app/view/widgets/event/congrats.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:pinput/pinput.dart';
import 'package:event_app/view/theme/theme_color.dart';
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
    return GetBuilder<verificationController>(
        init: verificationController(),
        builder: (controller) => Scaffold(
              backgroundColor: Colors.white,
              body: controller.isSubmit == false ? _buildBody() : Congrats(),
            ));
  }

  late Timer timer;

  late final FocusNode focusNode;
  late final GlobalKey<FormState> formKey;
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

  late final TextEditingController pinController;

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();

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
    pinController = TextEditingController();
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

  int secondsRemaining = 30;
  bool enableResend = false;

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
            GetBuilder<verificationController>(
                init: verificationController(),
                builder: (controller) => Container(
                      height: 50,
                      width: screenWidth * 2 / 3,
                      child: TextButton(
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                  EdgeInsets.all(15)),
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(primary),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                side: BorderSide(
                                    color: Colors.black45, width: 1.5),
                                borderRadius: BorderRadius.circular(10.0),
                              ))),
                          onPressed: () {
                            controller.onSubmit(
                                fToast as FToast,
                                pinController as TextEditingController,
                                _showToast);
                          },
                          child: const CustomText(
                            text: 'Submit',
                            alignment: Alignment.center,
                            textColor: Colors.white,
                            fontSize: 16,
                            fontFamily: 'DMSans',
                            fontWeight: FontWeight.w400,
                            align: TextAlign.center,
                            paddingLeft: 0,
                            paddingRight: 0,
                          )),
                    )),
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
                textColor: enableResend == true ? primary : ActiveColor),
          ],
        ));
  }
}
