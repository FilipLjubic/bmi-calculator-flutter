import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color color;
  final childWidget;

  ReusableCard({@required this.color, this.childWidget});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(15.0),
      child: childWidget,
      curve: Curves.ease,
      duration: Duration(milliseconds: 150),
    );
  }
}
