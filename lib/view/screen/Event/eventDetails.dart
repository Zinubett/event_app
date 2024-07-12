import 'package:event_app/view/theme/theme_color.dart';
import 'package:event_app/view/widgets/common.dart/custom_button.dart';
import 'package:event_app/view/widgets/common.dart/custom_text.dart';
import 'package:event_app/view/widgets/event/gridView_item.dart';
import 'package:event_app/view/widgets/event/saved_popup.dart';
import 'package:flutter/material.dart';

class EventDetails_screen extends StatefulWidget {
  @override
  _EventDetails_screenState createState() => _EventDetails_screenState();
}

class _EventDetails_screenState extends State<EventDetails_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  bool isSelected = false;
  final PageController _pageController = PageController();
  AppBar _buildAppBar() {
    return AppBar(
        backgroundColor: primary,
        elevation: 0,
        title: Container(
          alignment: Alignment.centerLeft,
        ));
  }

  Future saved_popUp(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return AlertDialog(
              contentPadding: EdgeInsets.zero,
              titlePadding: EdgeInsets.zero,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              title: Container(
                  padding: EdgeInsets.only(left: 15, right: 15),
                  height: 217,
                  width: 313,
                  color: Colors.white,
                  child: Saved_popup()),
            );
          });
        });
  }

  _buildBody() {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
        height: screenHeight,
        width: screenWidth,
        padding: EdgeInsets.only(left: 15, right: 15),
        child: Stack(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                Row(children: [
                  ...List.generate(
                      4,
                      (index) => Container(
                            height: 30,
                            width: 49,
                            margin: EdgeInsets.only(left: 4, right: 4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: index == 0 ? ActiveColor : Colors.white,
                                border: Border.all(
                                    color: index == 0 ? primary : stroke,
                                    width: 1)),
                            child: CustomText(
                                text: 'Food',
                                fontSize: 14,
                                fontFamily: 'DMSans',
                                align: TextAlign.start,
                                alignment: Alignment.centerLeft,
                                paddingLeft: 5,
                                paddingRight: 0,
                                fontWeight: FontWeight.w400,
                                textColor: index == 0 ? primary : black),
                          )),
                ]),
                const SizedBox(height: 15),
                Expanded(
                  child: SingleChildScrollView(
                      child: Column(
                    children: [
                      ...List.generate(
                        4,
                        (index) => Column(
                          children: [
                            const SizedBox(height: 15),
                            Row(
                              children: [
                                const CustomText(
                                    text: 'Food',
                                    fontSize: 24,
                                    fontFamily: 'DMSans',
                                    align: TextAlign.start,
                                    alignment: Alignment.centerLeft,
                                    paddingLeft: 0,
                                    paddingRight: 0,
                                    fontWeight: FontWeight.w400,
                                    textColor: black),
                                Expanded(child: Container()),
                                Container(
                                  width: 32,
                                  height: 32,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: const Color.fromRGBO(
                                          241, 241, 241, 1)),
                                  child: Image.asset(
                                    'images/refresh-2.png',
                                    width: 16,
                                    height: 16,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (isSelected == false) {
                                        isSelected = true;
                                      } else {
                                        isSelected = false;
                                      }
                                    });
                                  },
                                  child: Image.asset(
                                    isSelected == false
                                        ? 'images/arrow-down.png'
                                        : 'images/arrow-up.png',
                                    width: 24,
                                    height: 24,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            isSelected == false
                                ? GridView.builder(
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 1,
                                      childAspectRatio: (20 / 10),
                                      mainAxisSpacing: 10,
                                    ),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: 3,
                                    itemBuilder: (context, index) {
                                      return GridView_item();
                                    })
                                : Container()
                          ],
                        ),
                      )
                    ],
                  )),
                )
              ],
            ),
            GestureDetector(
              onTap: () {
                saved_popUp(context);
              },
              child: Container(
                margin: EdgeInsets.only(
                    top: screenHeight - 150, left: screenWidth - 100),
                height: 68,
                width: 68,
                alignment: Alignment.bottomRight,
                decoration: const BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage('images/Saved.png'))),
              ),
            )
          ],
        ));
  }
}
