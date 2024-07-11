import 'package:event_app/view/theme/theme_color.dart';
import 'package:event_app/view/widgets/common.dart/custom_text.dart';
import 'package:flutter/material.dart';

class GridView_item extends StatefulWidget {
  @override
  _GridView_itemState createState() => _GridView_itemState();
}

class _GridView_itemState extends State<GridView_item> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(1, 2), // changes position of shadow
            ),
          ],
          color: Colors.white),
      child: Column(
        children: [
          Container(
            height: 82,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12), topRight: Radius.circular(12)),
              image: DecorationImage(
                  image: AssetImage('images/event.png'), fit: BoxFit.cover),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              const SizedBox(
                width: 5,
              ),
              Image.asset('images/money.png'),
              const CustomText(
                  text: '1,000+',
                  fontSize: 12,
                  fontFamily: 'DMSans',
                  align: TextAlign.start,
                  alignment: Alignment.centerLeft,
                  paddingLeft: 5,
                  paddingRight: 0,
                  fontWeight: FontWeight.w400,
                  textColor: black),
              Expanded(child: Container()),
              Image.asset('images/timer.png'),
              const CustomText(
                  text: '< 25/hr',
                  fontSize: 12,
                  fontFamily: 'DMSans',
                  align: TextAlign.start,
                  alignment: Alignment.centerLeft,
                  paddingLeft: 5,
                  paddingRight: 0,
                  fontWeight: FontWeight.w400,
                  textColor: black),
              const SizedBox(
                width: 5,
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              const SizedBox(
                width: 5,
              ),
              Image.asset('images/location.png'),
              const CustomText(
                  text: 'Los Angeles, California',
                  fontSize: 12,
                  fontFamily: 'DMSans',
                  align: TextAlign.start,
                  alignment: Alignment.centerLeft,
                  paddingLeft: 5,
                  paddingRight: 0,
                  fontWeight: FontWeight.w400,
                  textColor: black),
              Expanded(child: Container()),
              Image.asset('images/profile-2user.png'),
              const CustomText(
                  text: '10 - 20',
                  fontSize: 12,
                  fontFamily: 'DMSans',
                  align: TextAlign.start,
                  alignment: Alignment.centerLeft,
                  paddingLeft: 5,
                  paddingRight: 0,
                  fontWeight: FontWeight.w400,
                  textColor: black),
              const SizedBox(
                width: 5,
              ),
            ],
          )
        ],
      ),
    );
  }
}
