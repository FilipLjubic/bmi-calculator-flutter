import 'package:flutter/material.dart';
import 'constants.dart';

class IconContent extends StatelessWidget {
  final IconData faIcon;
  final String faText;

  const IconContent({
    @required this.faIcon,
    @required this.faText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          faIcon,
          size: 80.0,
        ),
        SizedBox(height: 15.0),
        Text(
          faText,
          style: labelTextStyle,
        ),
      ],
    );
  }
}
