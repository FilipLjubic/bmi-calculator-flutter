import 'package:flutter/material.dart';
import 'package:bmi_calculator/utils/constants.dart';

class BottomNavBar extends StatelessWidget {
  final Function onTap;
  final String title;

  BottomNavBar({@required this.onTap, @required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(bottom: 10.0),
        color: bottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: bottomContainerHeight,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
