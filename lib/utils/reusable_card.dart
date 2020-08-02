import 'package:flutter/material.dart';

class ReusableCard extends StatefulWidget {
  final Color color;
  final Widget childWidget;
  final Function onTapFunction;

  ReusableCard({
    @required this.color,
    this.childWidget,
    this.onTapFunction,
  });

  @override
  _ReusableCardState createState() => _ReusableCardState();
}

class _ReusableCardState extends State<ReusableCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTapFunction,
      child: AnimatedContainer(
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.all(15.0),
        child: widget.childWidget,
        curve: Curves.ease,
        duration: Duration(milliseconds: 150),
      ),
    );
  }
}
