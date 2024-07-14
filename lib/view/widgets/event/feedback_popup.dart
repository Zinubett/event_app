import 'package:event_app/view/theme/theme_color.dart';
import 'package:event_app/view/widgets/common.dart/custom_button.dart';
import 'package:event_app/view/widgets/common.dart/custom_text.dart';
import 'package:flutter/material.dart';

class Feedback_popup extends StatefulWidget {
  final Function() onSubmit;
  const Feedback_popup({required this.onSubmit});
  @override
  _Feedback_popupState createState() => _Feedback_popupState();
}

class _Feedback_popupState extends State<Feedback_popup> {
  cancel() {
    Navigator.pop(context);
  }

  TextEditingController myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Container(
          margin: const EdgeInsets.only(
            left: 15,
            right: 15,
          ),
          height: 48,
          width: 48,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                'images/feedback.png',
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const CustomText(
            text: 'Feedback',
            fontSize: 16,
            fontFamily: 'DMSans',
            align: TextAlign.center,
            alignment: Alignment.center,
            paddingLeft: 0,
            paddingRight: 0,
            fontWeight: FontWeight.w400,
            textColor: black),
        const SizedBox(
          height: 15,
        ),
        const CustomText(
            text:
                'We\'d love to hear from you! Your insights are incredibly valuable and will help us make the app even better. Please share your feedback and let us know how we can improve your experience. Thank you for being a part of our journey!',
            fontSize: 12,
            fontFamily: 'DMSans',
            align: TextAlign.center,
            alignment: Alignment.center,
            paddingLeft: 0,
            paddingRight: 0,
            fontWeight: FontWeight.w400,
            textColor: black),
        const SizedBox(
          height: 30,
        ),
        SizedBox(
          height: 80,
          child: TextField(
            controller: myController,
            onChanged: (value) {},
            decoration: const InputDecoration(
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: stroke, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                hintText: 'How was your experience ...',
                hintStyle:
                    TextStyle(fontSize: 12, color: gray, fontFamily: 'DMSans')),
            style: const TextStyle(
                fontSize: 12, color: gray, fontFamily: 'DMSans'),
          ),
        ),
        SizedBox(
          height: 36,
          child: Row(
            children: [
              Expanded(
                  child: CustomButton(
                text: 'Later',
                imageUrl: "",
                buttonColor: black,
                textColor: Colors.white,
                onPressed: cancel,
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
                  text: 'Submit',
                  imageUrl: "",
                  buttonColor: primary,
                  textColor: Colors.white,
                  onPressed: widget.onSubmit,
                  fontFamily: 'DMSans',
                  buttonWidth: double.infinity,
                  fontSize: 12,
                  isText: true,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
