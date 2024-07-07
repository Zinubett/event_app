import 'package:event_app/view/theme/theme_color.dart';
import 'package:event_app/view/widgets/common.dart/custom_button.dart';
import 'package:event_app/view/widgets/common.dart/custom_text.dart';
import 'package:flutter/material.dart';

class SignIn_screen extends StatefulWidget {
  @override
  _SignIn_screenState createState() => _SignIn_screenState();
}

class _SignIn_screenState extends State<SignIn_screen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildBody(),
    );
  }

  bool obscureText = true;
  bool checkedValue = false;
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
              height: 25,
            ),
            const CustomText(
                text: 'Sign in',
                alignment: Alignment.centerLeft,
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
                text: 'Sign in to your account if you already have one.',
                textColor: black,
                alignment: Alignment.centerLeft,
                fontSize: 14,
                fontFamily: 'DMSans',
                align: TextAlign.start,
                paddingLeft: 0,
                paddingRight: 40),
            const SizedBox(
              height: 40,
            ),
            Column(
              children: [
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      fillColor: formColor,
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey.shade100, width: 1),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      hintText: 'Email',
                      hintStyle: TextStyle(fontSize: 16)),
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  controller: pwdController,
                  obscureText: obscureText,
                  decoration: InputDecoration(
                      fillColor: formColor,
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey.shade100, width: 0.5),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(5)),
                      ),
                      hintText: 'Password',
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
                      hintStyle: TextStyle(fontSize: 16)),
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: screenWidth * 2 / 5,
                  child: CheckboxListTile(
                      title: const CustomText(
                        text: 'Stay Logged in',
                        alignment: Alignment.centerLeft,
                        textColor: black,
                        fontFamily: 'DMSans',
                        fontSize: 12,
                        align: TextAlign.center,
                        paddingLeft: 5,
                        paddingRight: 5,
                      ),
                      contentPadding: EdgeInsets.only(right: 0),
                      controlAffinity: ListTileControlAffinity.leading,
                      value: checkedValue,
                      activeColor: primary,
                      onChanged: (val) {
                        setState(() {
                          checkedValue = val!;
                        });
                      }),
                ),
                Expanded(child: Container()),
                GestureDetector(
                  onTap: () {},
                  child: const CustomText(
                    text: 'Forgot password?',
                    alignment: Alignment.centerRight,
                    textColor: primary,
                    fontFamily: 'DMSans',
                    fontSize: 12,
                    align: TextAlign.center,
                    paddingLeft: 0,
                    paddingRight: 0,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const CustomButton(
              text: 'Login',
              imageUrl: "",
              buttonColor: primary,
              textColor: Colors.white,
              fontFamily: 'DMSans',
              buttonWidth: double.infinity,
              fontSize: 16,
              isText: true,
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
                padding: EdgeInsets.only(right: 35, left: 35),
                height: 50,
                alignment: Alignment.center,
                width: double.infinity,
                child: const CustomText(
                  text: "Login with ",
                  alignment: Alignment.center,
                  textColor: gray,
                  fontSize: 14,
                  fontFamily: 'DMSans',
                  align: TextAlign.center,
                  paddingLeft: 15,
                  paddingRight: 0,
                )),
            const SizedBox(
              height: 15,
            ),
            const Row(
              children: [
                Expanded(
                    child: CustomButton(
                  text: '',
                  imageUrl: "images/facebook_ic.png",
                  fontFamily: 'DMSans',
                  buttonColor: stroke,
                  buttonWidth: 0,
                  textColor: black,
                  fontSize: 14,
                  isText: false,
                )),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: CustomButton(
                    text: '',
                    imageUrl: "images/google.png",
                    fontFamily: 'DMSans',
                    fontSize: 14,
                    buttonColor: stroke,
                    buttonWidth: 0,
                    textColor: black,
                    isText: false,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: CustomButton(
                    text: '',
                    imageUrl: "images/Apple.png",
                    fontFamily: 'DMSans',
                    fontSize: 14,
                    buttonColor: stroke,
                    buttonWidth: 0,
                    textColor: black,
                    isText: false,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
                width: double.infinity,
                child: GestureDetector(
                    onTap: () {},
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: "Don’t have an account?",
                          textColor: gray,
                          alignment: Alignment.centerLeft,
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
                          text: "Register now",
                          textColor: primary,
                          alignment: Alignment.centerLeft,
                          fontSize: 14,
                          fontFamily: 'DMSans',
                          align: TextAlign.center,
                          paddingLeft: 0,
                          paddingRight: 0,
                        )
                      ],
                    ))),
          ],
        ));
  }
}
