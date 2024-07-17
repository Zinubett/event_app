import 'package:event_app/controller/user/verification_controller.dart';
import 'package:event_app/view/theme/theme_color.dart';
import 'package:event_app/view/widgets/common.dart/custom_button.dart';
import 'package:event_app/view/widgets/common.dart/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class Congrats extends StatefulWidget {
  @override
  _CongratsState createState() => _CongratsState();
}

class _CongratsState extends State<Congrats> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return GetBuilder<verificationController>(
        init: verificationController(),
        builder: (controller) => Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight * 1 / 4,
                ),
                Image(
                  image: controller.isDone == false
                      ? AssetImage("images/Successmark.png")
                      : AssetImage("images/Frame.png"),
                  width: 200,
                  height: 200,
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomText(
                    text: controller.isDone == false
                        ? 'Congratulations!'
                        : 'Welcome!',
                    alignment: Alignment.center,
                    fontWeight: FontWeight.w500,
                    textColor: primary,
                    fontSize: 24,
                    fontFamily: 'DMSans',
                    align: TextAlign.center,
                    paddingLeft: 0,
                    paddingRight: 0),
                const SizedBox(
                  height: 10,
                ),
                CustomText(
                    text: controller.isDone == false
                        ? 'Your email has been verified, you can now start'
                        : 'Thanks for downloading our app! We’re actively working on enhancing our functionality in these early stages. You’re among the first users and we appreciate any feedback you have.',
                    alignment: Alignment.center,
                    fontWeight: FontWeight.w400,
                    textColor: black,
                    fontSize: 14,
                    fontFamily: 'DMSans',
                    align: TextAlign.center,
                    paddingLeft: controller.isDone == false ? 65 : 0,
                    paddingRight: controller.isDone == false ? 65 : 0),
                const SizedBox(
                  height: 35,
                ),
                CustomButton(
                  text: controller.isDone == false ? 'Done' : 'Okay',
                  imageUrl: "",
                  buttonColor: primary,
                  textColor: Colors.white,
                  onPressed: controller.isDone == false
                      ? controller.onDone
                      : controller.onOkay,
                  fontFamily: 'DMSans',
                  buttonWidth: screenWidth * 2 / 3,
                  fontSize: 16,
                  isText: true,
                ),
              ],
            )));
  }
}
