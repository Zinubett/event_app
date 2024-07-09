import 'package:event_app/view/screen/user/signUp_screen.dart';
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

  _onLoginPressed() {}
  _onPressed() {}
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
                fontWeight: FontWeight.w500,
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
                fontWeight: FontWeight.w400,
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
                  decoration: const InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: stroke, width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      hintText: 'Email',
                      hintStyle: const TextStyle(
                          fontSize: 16, color: gray, fontFamily: 'DMSans')),
                  style: const TextStyle(
                      fontSize: 16, color: gray, fontFamily: 'DMSans'),
                ),
                const SizedBox(
                  height: 15,
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
                      hintStyle: const TextStyle(
                          fontSize: 16, color: gray, fontFamily: 'DMSans')),
                  style: const TextStyle(
                      fontSize: 16, color: gray, fontFamily: 'DMSans'),
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
                        fontWeight: FontWeight.w400,
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
                    fontWeight: FontWeight.w400,
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
            CustomButton(
              text: 'Login',
              imageUrl: "",
              buttonColor: primary,
              textColor: Colors.white,
              fontFamily: 'DMSans',
              onPressed: _onLoginPressed,
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
                  buttonWidth: 0,
                  onPressed: _onPressed,
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
                    onPressed: _onPressed,
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
                    onPressed: _onPressed,
                    fontSize: 14,
                    buttonColor: Colors.white,
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
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUp_screen()));
                    },
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
                          fontWeight: FontWeight.w400,
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
        ));
  }
}
