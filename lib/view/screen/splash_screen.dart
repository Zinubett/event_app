import 'package:event_app/view/theme/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:event_app/view/screen/homePage.dart';

class Splash_screen extends StatefulWidget {
  const Splash_screen({Key? key}) : super(key: key);

  @override
  _Splash_screenState createState() => _Splash_screenState();
}

class _Splash_screenState extends State<Splash_screen> {
  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    await Future.delayed(const Duration(milliseconds: 3000));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      body: _buildBody(),
    );
  }

  _buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(flex: 4, child: Container()),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: 15, right: 15),
          child: const Text('App Name',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontFamily: 'Aclonica',
              )),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: 15, right: 15),
          child: const Text(
              'Streamline Your Event Planning, Amplify Your Success!',
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
                fontFamily: 'DMSans',
              )),
        ),
        Expanded(flex: 4, child: Container()),
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.only(left: 15, right: 15),
          child: const Text('Version 0.0.1',
              maxLines: 2,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontFamily: 'DMSans',
              )),
        ),
        Expanded(child: Container()),
      ],
    );
  }
}
