import 'package:event_app/controller/user/signIn_controller.dart';
import 'package:event_app/controller/user/signUp_controller.dart';
import 'package:event_app/view/screen/user/signIn_screen.dart';
import 'package:event_app/view/screen/user/verification_screen.dart';
import 'package:event_app/view/theme/theme_color.dart';
import 'package:event_app/view/widgets/common.dart/custom_button.dart';
import 'package:event_app/view/widgets/common.dart/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class SignUp_screen extends StatefulWidget {
  @override
  _SignUp_screenState createState() => _SignUp_screenState();
}

class _SignUp_screenState extends State<SignUp_screen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController confirmPwdController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildBody(),
    );
  }

  bool obscureText1 = true;
  bool obscureText = true;
  bool checkedValue = false;

  _buildBody() {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return GetBuilder<signUpController>(
        init: signUpController(),
        builder: (controller) => Container(
            height: screenHeight,
            width: screenWidth,
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                const CustomText(
                    text: 'Sign up',
                    alignment: Alignment.centerLeft,
                    textColor: black,
                    fontSize: 32,
                    fontFamily: 'DMSans',
                    fontWeight: FontWeight.w500,
                    align: TextAlign.start,
                    paddingLeft: 0,
                    paddingRight: 40),
                const SizedBox(
                  height: 10,
                ),
                const CustomText(
                    text: 'Sign up now to start planning your next event',
                    textColor: black,
                    alignment: Alignment.centerLeft,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    fontFamily: 'DMSans',
                    align: TextAlign.start,
                    paddingLeft: 0,
                    paddingRight: 40),
                const SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: stroke, width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          hintText: 'Name*',
                          hintStyle: TextStyle(
                              fontSize: 16, color: gray, fontFamily: 'DMSans')),
                      style: const TextStyle(
                          fontSize: 16, color: gray, fontFamily: 'DMSans'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: usernameController,
                      decoration: const InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: stroke, width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          hintText: 'Username*',
                          hintStyle: TextStyle(
                              fontSize: 16, color: gray, fontFamily: 'DMSans')),
                      style: const TextStyle(
                          fontSize: 16, color: gray, fontFamily: 'DMSans'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: stroke, width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          hintText: 'Email*',
                          hintStyle: TextStyle(
                              fontSize: 16, color: gray, fontFamily: 'DMSans')),
                      style: const TextStyle(
                          fontSize: 16, color: gray, fontFamily: 'DMSans'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: pwdController,
                      obscureText: obscureText,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(color: stroke, width: 0.5),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          hintText: 'Password*',
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                if (obscureText == true) {
                                  obscureText = false;
                                } else {
                                  obscureText = true;
                                }
                              });
                            },
                            child: Icon(Icons.remove_red_eye_sharp),
                          ),
                          hintStyle: const TextStyle(
                              fontSize: 16, color: gray, fontFamily: 'DMSans')),
                      style: const TextStyle(
                          fontSize: 16, color: gray, fontFamily: 'DMSans'),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: confirmPwdController,
                      obscureText: obscureText1,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(color: stroke, width: 0.5),
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          hintText: 'Confirm Password*',
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                if (obscureText1 == true) {
                                  obscureText1 = false;
                                } else {
                                  obscureText1 = true;
                                }
                              });
                            },
                            child: Icon(Icons.remove_red_eye_sharp),
                          ),
                          hintStyle: const TextStyle(
                              fontSize: 16, color: gray, fontFamily: 'DMSans')),
                      style: const TextStyle(
                          fontSize: 16, color: gray, fontFamily: 'DMSans'),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomButton(
                  text: 'Sign Up',
                  imageUrl: "",
                  buttonColor: primary,
                  onPressed: controller.onSignUp,
                  textColor: Colors.white,
                  fontFamily: 'DMSans',
                  buttonWidth: double.infinity,
                  fontSize: 16,
                  isText: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                    padding: EdgeInsets.only(right: 35, left: 35),
                    height: 50,
                    alignment: Alignment.center,
                    width: double.infinity,
                    child: const CustomText(
                      text: "Sign Up with ",
                      alignment: Alignment.center,
                      fontWeight: FontWeight.w400,
                      textColor: gray,
                      fontSize: 14,
                      fontFamily: 'DMSans',
                      align: TextAlign.center,
                      paddingLeft: 0,
                      paddingRight: 0,
                    )),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                        child: CustomButton(
                      text: '',
                      imageUrl: "images/facebook_ic.png",
                      fontFamily: 'DMSans',
                      buttonColor: Colors.white,
                      onPressed: controller.onPressed,
                      buttonWidth: 0,
                      textColor: black,
                      fontSize: 14,
                      isText: false,
                    )),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: CustomButton(
                        text: '',
                        imageUrl: "images/google.png",
                        fontFamily: 'DMSans',
                        fontSize: 14,
                        onPressed: controller.onPressed,
                        buttonColor: Colors.white,
                        buttonWidth: 0,
                        textColor: black,
                        isText: false,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: CustomButton(
                        text: '',
                        imageUrl: "images/Apple.png",
                        fontFamily: 'DMSans',
                        fontSize: 14,
                        onPressed: controller.onPressed,
                        buttonColor: Colors.white,
                        buttonWidth: 0,
                        textColor: black,
                        isText: false,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                    width: double.infinity,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignIn_screen()));
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              text: "Already have an account?",
                              textColor: gray,
                              alignment: Alignment.centerLeft,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              fontFamily: 'DMSans',
                              align: TextAlign.center,
                              paddingLeft: 15,
                              paddingRight: 0,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            CustomText(
                              text: "Login now",
                              textColor: primary,
                              alignment: Alignment.centerLeft,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              fontFamily: 'DMSans',
                              align: TextAlign.center,
                              paddingLeft: 0,
                              paddingRight: 0,
                            )
                          ],
                        ))),
              ],
            )));
  }
}
