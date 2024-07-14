import 'package:event_app/view/theme/theme_color.dart';
import 'package:event_app/view/widgets/common.dart/custom_text.dart';
import 'package:event_app/view/widgets/event/gridView_item.dart';
import 'package:flutter/material.dart';

class Saves_screen extends StatefulWidget {
  @override
  _Saves_screenState createState() => _Saves_screenState();
}

class _Saves_screenState extends State<Saves_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  final List<String> tips = [
    '.Plan your event timeline in advance.',
    '.Consider virtual and hybrid event options.',
    '.Utilize their 24/7 customer service for last-minute changes.',
  ];
  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: primary,
      elevation: 0,
      title: Container(
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              Expanded(
                child: Container(),
              ),
              Image.asset(
                'images/Group.png',
                height: 19.14,
                width: 22.17,
              )
            ],
          )),
    );
  }

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
            height: 15,
          ),
          Expanded(
            child: SingleChildScrollView(
                child: Column(
              children: [
                ...List.generate(
                  4,
                  (index) => Column(
                    children: [
                      const SizedBox(height: 15),
                      GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            childAspectRatio: (20 / 15),
                            mainAxisSpacing: 10,
                          ),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                GridView_item(),
                                const SizedBox(
                                  height: 15,
                                ),
                                const CustomText(
                                    text: 'Tips and Tricks:',
                                    fontSize: 14,
                                    fontFamily: 'DMSans',
                                    align: TextAlign.start,
                                    alignment: Alignment.centerLeft,
                                    paddingLeft: 5,
                                    paddingRight: 0,
                                    fontWeight: FontWeight.w500,
                                    textColor: black),
                                Column(
                                  children: [
                                    ...List.generate(
                                        tips.length,
                                        (index) => Column(
                                              children: [
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                CustomText(
                                                    text: tips[index],
                                                    fontSize: 14,
                                                    fontFamily: 'DMSans',
                                                    align: TextAlign.start,
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    paddingLeft: 15,
                                                    paddingRight: 0,
                                                    fontWeight: FontWeight.w400,
                                                    textColor: black),
                                              ],
                                            ))
                                  ],
                                )
                              ],
                            );
                          }),
                    ],
                  ),
                )
              ],
            )),
          )
        ],
      ),
    );
  }
}
