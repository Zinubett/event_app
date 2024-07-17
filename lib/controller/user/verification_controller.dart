import 'package:event_app/view/screen/question/eventForm_screen.dart';
import 'package:event_app/view/widgets/common.dart/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class verificationController extends GetxController {
  String errorMessage = "";
  bool isSubmit = false;
  bool isDone = false;

  onSubmit(
      FToast fToast, TextEditingController pinController, final showToast) {
    if (pinController.text.length != 6) {
      errorMessage = 'Please fill in the OTP box!';
      showToast(errorMessage);
    } else {
      isSubmit = true;
    }
    update();
  }

  onOkay() {
    Get.off(EventForm_screen());

    update();
  }

  onDone() {
    isDone = true;

    update();
  }
}
