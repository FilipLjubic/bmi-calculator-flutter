import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/utils/icon_content.dart';
import 'package:bmi_calculator/utils/reusable_card.dart';

const bottomContainerHeight = 70.0;
const bottomContainerColor = Color(0xFFEB1555);
const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = inactiveCardColor;
  Color femaleCardColor = inactiveCardColor;
  bool genderSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => selectColor(1),
                    child: ReusableCard(
                      color: maleCardColor,
                      childWidget: IconContent(
                        faIcon: FontAwesomeIcons.mars,
                        faText: "MALE",
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => selectColor(2),
                    child: ReusableCard(
                      color: femaleCardColor,
                      childWidget: IconContent(
                        faIcon: FontAwesomeIcons.venus,
                        faText: "FEMALE",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: activeCardColor,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: activeCardColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: activeCardColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            color: bottomContainerColor,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: bottomContainerHeight,
            child: Text(
              "CALCULATE",
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void selectColor(int gender) {
    return setState(() {
      if (gender == 2) {
        femaleCardColor = updateCardColor(femaleCardColor);
        if (femaleCardColor == maleCardColor &&
            femaleCardColor == activeCardColor)
          maleCardColor = updateCardColor(maleCardColor);
      } else {
        maleCardColor = updateCardColor(maleCardColor);
        if (femaleCardColor == maleCardColor &&
            maleCardColor == activeCardColor)
          femaleCardColor = updateCardColor(femaleCardColor);
      }
    });
  }

  Color updateCardColor(Color colour) {
    return colour == inactiveCardColor ? activeCardColor : inactiveCardColor;
  }
}
