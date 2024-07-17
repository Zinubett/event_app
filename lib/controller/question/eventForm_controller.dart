import 'package:event_app/Model/question_model.dart';
import 'package:event_app/view/screen/Event/eventDetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class eventFormController extends GetxController {
  int currentQuestion = 0;

  onPageChanged(int index) {
    currentQuestion = index;
    update();
  }

  onNext(PageController _pageController, final _showToast, String errMessage) {
    if (sampleQuestions[currentQuestion].answer != '') {
      if (currentQuestion + 1 < sampleQuestions.length) {
        _pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
        currentQuestion++;
      } else {
        Get.to(EventDetails_screen());
      }
    } else {
      sampleQuestions[currentQuestion].errMessage = errMessage;
      _showToast(errMessage);
    }
    update();
  }

  onSelectItem(
    int index,
    int optionIndex,
  ) {
    sampleQuestions[index].answer = sampleQuestions[index].options[optionIndex];
    if (index == 0 &&
        (optionIndex == 0 || optionIndex == 1) &&
        (sampleQuestions.contains(addQuestions[index]) == false ||
            sampleQuestions.contains(addQuestions[3]) == false)) {
      sampleQuestions.add(addQuestions[index]);
      sampleQuestions.add(addQuestions[3]);
    } else if (index == 3 &&
        optionIndex == 0 &&
        sampleQuestions.contains(addQuestions[1]) == false) {
      sampleQuestions.add(addQuestions[1]);
    } else if (index == 0 &&
        (optionIndex == 0) &&
        sampleQuestions.contains(addQuestions[4]) == false) {
      sampleQuestions.add(addQuestions[4]);
    } else if ((sampleQuestions.contains(addQuestions[index]) == true ||
            sampleQuestions.contains(addQuestions[3]) == true) &&
        index == 0 &&
        optionIndex == 2) {
      sampleQuestions.remove(addQuestions[3]);
      sampleQuestions.remove(addQuestions[index]);
    } else if (index == 3 &&
        optionIndex == 1 &&
        sampleQuestions.contains(addQuestions[1]) == true) {
      sampleQuestions.remove(addQuestions[1]);
    }
    update();
  }
}
