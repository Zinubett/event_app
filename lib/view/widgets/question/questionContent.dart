import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:event_app/Model/question_model.dart';
import 'package:event_app/view/theme/theme_color.dart';
import 'package:event_app/view/widgets/common.dart/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:intl/intl.dart';

class QuestionContent extends StatefulWidget {
  final int index;
  const QuestionContent({required this.index});
  @override
  _QuestionContentState createState() => _QuestionContentState();
}

class _QuestionContentState extends State<QuestionContent> {
  TextEditingController answerController = TextEditingController();
  DateTime newDateTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return sampleQuestions[widget.index].isDataEnter == true
        ? _build_textField()
        : (sampleQuestions[widget.index].isSelectable == true
            ? _build_selectableList()
            : _build_dropDownButton());
  }

  Widget _build_dropDownButton() {
    return Container(
      height: 60,
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: DropdownButtonFormField2<String>(
        isExpanded: true,
        decoration: InputDecoration(
          hintMaxLines: sampleQuestions[widget.index].options.length,
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        items: sampleQuestions[widget.index]
            .options
            .map((item) => DropdownMenuItem<String>(
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
            sampleQuestions[widget.index].answer = value!;
          });
        },
        onSaved: (value) {},
        buttonStyleData: const ButtonStyleData(
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
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          padding: EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
    );
  }

  onSelect(int optionIndex) {
    setState(() {
      sampleQuestions[widget.index].answer =
          sampleQuestions[widget.index].options[optionIndex];
      if (widget.index == 0 &&
          (optionIndex == 0 || optionIndex == 1) &&
          (sampleQuestions.contains(addQuestions[widget.index]) == false ||
              sampleQuestions.contains(addQuestions[3]) == false)) {
        sampleQuestions.add(addQuestions[widget.index]);
        sampleQuestions.add(addQuestions[3]);
      } else if (widget.index == 3 &&
          optionIndex == 0 &&
          sampleQuestions.contains(addQuestions[1]) == false) {
        sampleQuestions.add(addQuestions[1]);
      } else if (widget.index == 0 &&
          (optionIndex == 0) &&
          sampleQuestions.contains(addQuestions[4]) == false) {
        sampleQuestions.add(addQuestions[4]);
      }
    });
  }

  Widget _build_selectableList() {
    return Column(
      children: [
        ...List.generate(
            sampleQuestions[widget.index].options.length,
            (optionIndex) => GestureDetector(
                onTap: () {
                  onSelect(optionIndex);
                },
                child: Container(
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                        color: sampleQuestions[widget.index].answer ==
                                sampleQuestions[widget.index]
                                    .options[optionIndex]
                            ? ActiveColor
                            : Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            width: 1,
                            color: sampleQuestions[widget.index].answer ==
                                    sampleQuestions[widget.index]
                                        .options[optionIndex]
                                ? borderActiveColor
                                : stroke)),
                    child: CustomText(
                        text:
                            sampleQuestions[widget.index].options[optionIndex],
                        fontSize: 14,
                        fontFamily: 'DMSans',
                        align: TextAlign.start,
                        alignment: Alignment.centerLeft,
                        paddingLeft: 5,
                        paddingRight: 0,
                        fontWeight: FontWeight.w400,
                        textColor: black))))
      ],
    );
  }

  Widget _build_textField() {
    double screenHeight = MediaQuery.of(context).size.height;
    return TextField(
      controller: answerController,
      onChanged: (value) {},
      readOnly: true,
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: stroke, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          hintText: 'Enter the event date',
          suffixIcon: GestureDetector(
            onTap: () async {
              newDateTime = (await showRoundedDatePicker(
                height: screenHeight * 1 / 3,
                context: context,
                theme: ThemeData(
                  colorScheme: ColorScheme.fromSeed(seedColor: primary),
                  useMaterial3: true,
                ),
                initialDate: DateTime.now(),
                firstDate: DateTime(DateTime.now().year),
                lastDate: DateTime(DateTime.now().year + 3),
                borderRadius: 16,
              ))!;
              var outputFormat = DateFormat('MM/dd/yyyy');
              var outputDate = outputFormat.format(newDateTime);
              answerController.text = outputDate.toString();
              setState(() {
                sampleQuestions[widget.index].answer = answerController.text;
              });
            },
            child: const Icon(
              Icons.date_range_rounded,
              color: primary,
            ),
          ),
          hintStyle:
              const TextStyle(fontSize: 16, color: gray, fontFamily: 'DMSans')),
      style: const TextStyle(fontSize: 16, color: gray, fontFamily: 'DMSans'),
    );
  }
}
