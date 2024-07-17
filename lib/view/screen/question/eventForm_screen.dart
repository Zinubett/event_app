import 'package:event_app/Model/question_model.dart';
import 'package:event_app/controller/question/eventForm_controller.dart';
import 'package:event_app/view/theme/theme_color.dart';
import 'package:event_app/view/widgets/common.dart/custom_button.dart';
import 'package:event_app/view/widgets/common.dart/custom_text.dart';
import 'package:event_app/view/widgets/question/questionContent.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class EventForm_screen extends StatefulWidget {
  @override
  _EventForm_screenState createState() => _EventForm_screenState();
}

class _EventForm_screenState extends State<EventForm_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  String errMessage = 'You should answer the question first!';

  late FToast fToast;
  @override
  void initState() {
    super.initState();

    fToast = FToast();
    // if you want to use context from globally instead of content we need to pass navigatorKey.currentContext!
    fToast.init(context);
  }

  _showToast(String msg) {
    Widget toast = Container(
      height: 100,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.redAccent,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline_outlined,
            color: Colors.white,
            size: 25,
          ),
          const SizedBox(
            width: 10.0,
          ),
          Container(
            child: CustomText(
                text: msg,
                fontSize: 14,
                fontFamily: 'DMSans',
                align: TextAlign.center,
                alignment: Alignment.centerLeft,
                paddingLeft: 0,
                paddingRight: 0,
                fontWeight: FontWeight.w400,
                textColor: Colors.white),
          ),
        ],
      ),
    );
    fToast.showToast(
      child: toast,
      gravity: ToastGravity.CENTER,
      toastDuration: const Duration(seconds: 2),
    );
  }

  final PageController _pageController = PageController();
  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: primary,
      elevation: 0,
      title: Container(
          alignment: Alignment.centerLeft,
          child: const CustomText(
              text: 'Event Form',
              fontSize: 16,
              fontFamily: 'DMSans',
              align: TextAlign.center,
              alignment: Alignment.center,
              paddingLeft: 0,
              paddingRight: 0,
              fontWeight: FontWeight.w500,
              textColor: Colors.white)),
    );
  }

  _buildBody() {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return GetBuilder<eventFormController>(
        init: eventFormController(),
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
                      sampleQuestions.length,
                      (index) => Container(
                            height: 6,
                            width: 34,
                            margin: EdgeInsets.only(left: 2, right: 2),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: controller.currentQuestion >= index
                                    ? primary
                                    : unActiveColor),
                          )),
                ]),
                const SizedBox(height: 15),
                Expanded(
                    child: PageView.builder(
                        controller: _pageController,
                        pageSnapping: false,
                        itemCount: sampleQuestions.length,
                        physics: const BouncingScrollPhysics(),
                        onPageChanged: (index) {
                          controller.onPageChanged(index);
                        },
                        itemBuilder: (context, index) {
                          return ListView(
                              physics: const BouncingScrollPhysics(),
                              children: [
                                const SizedBox(
                                  height: 15,
                                ),
                                CustomText(
                                    text: sampleQuestions[index].question,
                                    fontSize: 24,
                                    fontFamily: 'DMSans',
                                    align: TextAlign.start,
                                    alignment: Alignment.centerLeft,
                                    paddingLeft: 5,
                                    paddingRight: 0,
                                    fontWeight: FontWeight.w400,
                                    textColor: primary),
                                const SizedBox(height: 25),
                                QuestionContent(index: index)
                              ]);
                        })),
                Container(
                  height: 50,
                  width: screenWidth * 2 / 3,
                  child: TextButton(
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.all(15)),
                          backgroundColor:
                              MaterialStateProperty.all<Color>(primary),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black45, width: 1.5),
                            borderRadius: BorderRadius.circular(10.0),
                          ))),
                      onPressed: () {
                        controller.onNext(
                            _pageController, _showToast, errMessage);
                      },
                      child: const CustomText(
                        text: 'Next',
                        alignment: Alignment.center,
                        textColor: Colors.white,
                        fontSize: 16,
                        fontFamily: 'DMSans',
                        fontWeight: FontWeight.w400,
                        align: TextAlign.center,
                        paddingLeft: 0,
                        paddingRight: 0,
                      )),
                ),
                const SizedBox(height: 30)
              ],
            )));
  }
}
