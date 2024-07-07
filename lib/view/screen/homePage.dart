import 'package:event_app/view/screen/user/signIn_screen.dart';
import 'package:event_app/view/theme/theme_color.dart';
import 'package:event_app/view/widgets/common.dart/custom_text.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildBody(),
    );
  }

  int step = 1;
  _buildBody() {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
        height: screenHeight,
        width: screenWidth,
        decoration: BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.fill,
          image: step == 1
              ? AssetImage('images/Rectangle_17.png')
              : (step == 2
                  ? AssetImage('images/Rectangle_18.png')
                  : AssetImage('images/Rectangle_19.png')),
        )),
        child: Column(
          children: [
            Expanded(
              flex: 7,
              child: Container(),
            ),
            Container(
              margin: EdgeInsets.only(right: screenWidth * 1 / 4, left: 15),
              child: Column(
                children: [
                  CustomText(
                    fontSize: 32,
                    textColor: Colors.white,
                    alignment: Alignment.centerLeft,
                    fontFamily: 'DMSans',
                    align: TextAlign.start,
                    text: step == 1
                        ? 'Want to Organize Your Event?'
                        : (step == 2
                            ? 'Need Someone To Setup a Workshop'
                            : 'Holiday Party with Fun and Friends.'),
                    paddingLeft: 0,
                    paddingRight: 0,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomText(
                    fontSize: 14,
                    textColor: Colors.white,
                    alignment: Alignment.centerLeft,
                    fontFamily: 'DMSans',
                    align: TextAlign.start,
                    text: step == 1
                        ? 'Let us organize your event at the venue and theme of your own choice.'
                        : (step == 2
                            ? 'Let us organize your event at the venue and theme of your own choice.'
                            : 'Let us organize your event at the venue and theme of your own choice.'),
                    paddingLeft: 0,
                    paddingRight: 0,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.only(left: 15),
              child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Container(
                  height: 6,
                  width: step == 1 ? 10 : 5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: step == 1 ? primary : Colors.white),
                ),
                const SizedBox(
                  width: 3,
                ),
                Container(
                  height: 6,
                  width: step == 2 ? 10 : 5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: step == 2 ? primary : Colors.white),
                ),
                const SizedBox(
                  width: 3,
                ),
                Container(
                  height: 6,
                  width: step == 3 ? 10 : 5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: step == 3 ? primary : Colors.white),
                ),
              ]),
            ),
            const SizedBox(
              height: 35,
            ),
            Container(
              padding: const EdgeInsets.only(left: 15, right: 15),
              width: double.infinity,
              height: 50,
              child: TextButton(
                style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        EdgeInsets.all(15)),
                    backgroundColor: MaterialStateProperty.all<Color>(primary),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ))),
                onPressed: () {
                  setState(() {
                    if (step < 3) {
                      step = step + 1;
                    } else if (step == 3) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignIn_screen()),
                      );
                    }
                  });
                },
                child: Text(
                  step == 3 ? "Get Started" : "Next",
                  style: TextStyle(
                      fontSize: 16, color: Colors.white, fontFamily: 'DMSans'),
                ),
              ),
            ),
            Expanded(
              child: Container(),
            )
          ],
        ));
  }
}
