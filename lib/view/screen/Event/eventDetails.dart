import 'package:event_app/controller/event/eventDetails_controller.dart';
import 'package:event_app/view/screen/Event/saves.dart';
import 'package:event_app/view/theme/theme_color.dart';
import 'package:event_app/view/widgets/common.dart/custom_button.dart';
import 'package:event_app/view/widgets/common.dart/custom_text.dart';
import 'package:event_app/view/widgets/event/gridView_item.dart';
import 'package:event_app/view/widgets/event/saved_popup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            saved_popUp(context);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          backgroundColor: primary,
          child: Container(
              height: 68,
              width: 68,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100), color: primary),
              child:
                  Image.asset('images/save-2.png', height: 27.2, width: 27.2))),
    );
  }

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
            return GetBuilder<eventDetailsController>(
                init: eventDetailsController(),
                builder: (controller) => AlertDialog(
                      contentPadding: EdgeInsets.zero,
                      titlePadding: EdgeInsets.zero,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      title: Container(
                          padding: EdgeInsets.only(left: 15, right: 15),
                          height: 165,
                          width: 313,
                          color: Colors.white,
                          child: Saved_popup()),
                      content: Container(
                        color: Colors.white,
                        height: 65,
                        padding: const EdgeInsets.all(10),
                        child: SizedBox(
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: CustomButton(
                                text: 'Cancel',
                                imageUrl: "",
                                buttonColor: black,
                                textColor: Colors.white,
                                onPressed: controller.cancel,
                                fontFamily: 'DMSans',
                                buttonWidth: double.infinity,
                                fontSize: 12,
                                isText: true,
                              )),
                              const SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                flex: 2,
                                child: CustomButton(
                                  text: 'View Results',
                                  imageUrl: "",
                                  buttonColor: primary,
                                  textColor: Colors.white,
                                  onPressed: controller.getResult,
                                  fontFamily: 'DMSans',
                                  buttonWidth: double.infinity,
                                  fontSize: 12,
                                  isText: true,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ));
          });
        });
  }

  final List<bool> isSelected = [false, false, false, false];
  int selectedIndex = 0;
  _buildBody() {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return GetBuilder<eventDetailsController>(
        init: eventDetailsController(),
        builder: (controller) => Container(
            height: screenHeight,
            width: screenWidth,
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                Row(children: [
                  ...List.generate(
                    controller.categories.length,
                    (index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Container(
                          height: 30,
                          width: 60,
                          margin: EdgeInsets.only(left: 4, right: 4),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: index == selectedIndex
                                  ? ActiveColor
                                  : Colors.white,
                              border: Border.all(
                                  color:
                                      index == selectedIndex ? primary : stroke,
                                  width: 1)),
                          child: CustomText(
                              text: controller.categories[index],
                              fontSize: 14,
                              fontFamily: 'DMSans',
                              align: TextAlign.center,
                              alignment: Alignment.center,
                              paddingLeft: 5,
                              paddingRight: 0,
                              fontWeight: FontWeight.w400,
                              textColor:
                                  index == selectedIndex ? primary : black),
                        )),
                  )
                ]),
                const SizedBox(height: 15),
                Expanded(
                  child: SingleChildScrollView(
                      child: Column(
                    children: [
                      ...List.generate(
                        controller.categories.length,
                        (index) => Column(
                          children: [
                            const SizedBox(height: 15),
                            Row(
                              children: [
                                CustomText(
                                    text: controller.categories[index],
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
                                      if (isSelected[index] == false) {
                                        isSelected[index] = true;
                                      } else {
                                        isSelected[index] = false;
                                      }
                                    });
                                  },
                                  child: Image.asset(
                                    isSelected[index] == false
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
                            isSelected[index] == false
                                ? GridView.builder(
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 1,
                                      childAspectRatio: (20 / 10),
                                      mainAxisSpacing: 10,
                                    ),
                                    shrinkWrap: true,
                                    physics: ScrollPhysics(),
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
            )));
  }
}
