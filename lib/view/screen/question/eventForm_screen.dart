import 'package:event_app/Model/question_model.dart';
import 'package:event_app/view/screen/Event/eventDetails.dart';
import 'package:event_app/view/theme/theme_color.dart';
import 'package:event_app/view/widgets/common.dart/custom_button.dart';
import 'package:event_app/view/widgets/common.dart/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

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

  int currentQuestion = 0;
  onNext() {
    if (currentQuestion + 1 < sampleQuestions.length) {
      setState(() {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
        currentQuestion++;
      });
    } else {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => EventDetails_screen()));
    }
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

  TextEditingController answerController = TextEditingController();
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
            Row(children: [
              ...List.generate(
                  sampleQuestions.length,
                  (index) => Container(
                        height: 6,
                        width: 34,
                        margin: EdgeInsets.only(left: 2, right: 2),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: currentQuestion >= index
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
                      setState(() {
                        currentQuestion = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      final question = sampleQuestions[index];
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
                            sampleQuestions[index].isDataEnter == true
                                ? TextField(
                                    controller: answerController,
                                    onChanged: (value) {
                                      sampleQuestions[index].answer = value;
                                    },
                                    decoration: InputDecoration(
                                        fillColor: Colors.white,
                                        filled: true,
                                        border: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: stroke, width: 1),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                        ),
                                        hintText: 'Enter the event date',
                                        suffixIcon: GestureDetector(
                                          onTap: () {},
                                          child: const Icon(
                                            Icons.date_range_rounded,
                                            color: primary,
                                          ),
                                        ),
                                        hintStyle: const TextStyle(
                                            fontSize: 16,
                                            color: gray,
                                            fontFamily: 'DMSans')),
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: gray,
                                        fontFamily: 'DMSans'),
                                  )
                                : (sampleQuestions[index].isSelectable == true
                                    ? Column(
                                        children: [
                                          ...List.generate(
                                              sampleQuestions[index]
                                                  .options
                                                  .length,
                                              (optionIndex) => GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      sampleQuestions[index]
                                                              .answer =
                                                          sampleQuestions[index]
                                                                  .options[
                                                              optionIndex];
                                                      if (index == 0 &&
                                                          (optionIndex == 0 ||
                                                              optionIndex ==
                                                                  1) &&
                                                          (sampleQuestions.contains(
                                                                      addQuestions[
                                                                          index]) ==
                                                                  false ||
                                                              sampleQuestions.contains(
                                                                      addQuestions[
                                                                          3]) ==
                                                                  false)) {
                                                        sampleQuestions.add(
                                                            addQuestions[
                                                                index]);
                                                        sampleQuestions.add(
                                                            addQuestions[3]);
                                                      } else if (index == 3 &&
                                                          optionIndex == 0 &&
                                                          sampleQuestions.contains(
                                                                  addQuestions[
                                                                      1]) ==
                                                              false) {
                                                        sampleQuestions.add(
                                                            addQuestions[1]);
                                                      } else if (index == 0 &&
                                                          (optionIndex == 0) &&
                                                          sampleQuestions.contains(
                                                                  addQuestions[
                                                                      4]) ==
                                                              false) {
                                                        sampleQuestions.add(
                                                            addQuestions[4]);
                                                      }
                                                    });
                                                  },
                                                  child: Container(
                                                      padding: const EdgeInsets.all(
                                                          15),
                                                      margin: const EdgeInsets.only(
                                                          bottom: 15),
                                                      decoration: BoxDecoration(
                                                          color: sampleQuestions[index].answer == sampleQuestions[index].options[optionIndex]
                                                              ? ActiveColor
                                                              : Colors.white,
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  12),
                                                          border: Border.all(
                                                              width: 1,
                                                              color: sampleQuestions[index].answer == sampleQuestions[index].options[optionIndex]
                                                                  ? borderActiveColor
                                                                  : stroke)),
                                                      child: CustomText(
                                                          text: sampleQuestions[index]
                                                              .options[optionIndex],
                                                          fontSize: 14,
                                                          fontFamily: 'DMSans',
                                                          align: TextAlign.start,
                                                          alignment: Alignment.centerLeft,
                                                          paddingLeft: 5,
                                                          paddingRight: 0,
                                                          fontWeight: FontWeight.w400,
                                                          textColor: black))))
                                        ],
                                      )
                                    : Container(
                                        height: 60,
                                        padding: const EdgeInsets.only(
                                            left: 15, right: 15),
                                        child: DropdownButtonFormField2<String>(
                                          isExpanded: true,
                                          decoration: InputDecoration(
                                            hintMaxLines: sampleQuestions[index]
                                                .options
                                                .length,
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    vertical: 16),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                          items: sampleQuestions[index]
                                              .options
                                              .map((item) =>
                                                  DropdownMenuItem<String>(
                                                    value: item,
                                                    child: Text(
                                                      item,
                                                      style: const TextStyle(
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ))
                                              .toList(),
                                          validator: (value) {
                                            if (value == null) {
                                              return '';
                                            }
                                            return null;
                                          },
                                          onChanged: (value) {
                                            setState(() {
                                              sampleQuestions[index].answer =
                                                  value!;
                                            });
                                          },
                                          onSaved: (value) {},
                                          buttonStyleData:
                                              const ButtonStyleData(
                                            padding: EdgeInsets.only(right: 8),
                                          ),
                                          iconStyleData: const IconStyleData(
                                            icon: Icon(
                                              Icons.arrow_drop_down,
                                              color: Colors.black45,
                                            ),
                                            iconSize: 24,
                                          ),
                                          dropdownStyleData: DropdownStyleData(
                                            maxHeight: 150,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                          ),
                                          menuItemStyleData:
                                              const MenuItemStyleData(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 16),
                                          ),
                                        ),
                                      )),
                            SizedBox(
                              height: screenHeight * 1 / 4,
                            ),
                            CustomButton(
                              text: 'Next',
                              imageUrl: "",
                              buttonColor: primary,
                              textColor: Colors.white,
                              onPressed: onNext,
                              fontFamily: 'DMSans',
                              buttonWidth: double.infinity,
                              fontSize: 16,
                              isText: true,
                            ),
                          ]);
                    }))
          ],
        ));
  }
}
