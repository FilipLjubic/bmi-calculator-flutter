import 'package:bmi_calculator/screens/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/utils/icon_content.dart';
import 'package:bmi_calculator/utils/reusable_card.dart';
import 'package:bmi_calculator/utils/constants.dart';
import 'package:bmi_calculator/utils/bottom_nav_bar.dart';
import 'package:bmi_calculator/utils/round_icon_button.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  double height = 170;
  int weight = 60;
  int age = 19;

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
                  child: ReusableCard(
                    onTapFunction: () =>
                        setState(() => selectedGender = Gender.male),
                    color: selectedGender == Gender.male
                        ? activeCardColor
                        : inactiveCardColor,
                    childWidget: IconContent(
                      faIcon: FontAwesomeIcons.mars,
                      faText: "MALE",
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onTapFunction: () =>
                        setState(() => selectedGender = Gender.female),
                    color: selectedGender == Gender.female
                        ? activeCardColor
                        : inactiveCardColor,
                    childWidget: IconContent(
                      faIcon: FontAwesomeIcons.venus,
                      faText: "FEMALE",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: activeCardColor,
              childWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("HEIGHT", style: labelTextStyle),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "${height.truncate()}",
                          style: numberStyle,
                        ),
                        TextSpan(text: "cm"),
                      ],
                    ),
                  ),
                  Slider(
                    value: height,
                    onChanged: (newRating) {
                      setState(() => height = newRating);
                    },
                    divisions: 90,
                    min: 130,
                    max: 220,
                    inactiveColor: Color(0xFF8E8D98),
                    activeColor: bottomContainerColor,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: activeCardColor,
                    childWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("WEIGHT", style: labelTextStyle),
                        Text(weight.toString(), style: numberStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () => setState(() => weight--),
                            ),
                            SizedBox(width: 10.0),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () => setState(() => weight++),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: activeCardColor,
                    childWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("AGE", style: labelTextStyle),
                        Text(age.toString(), style: numberStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () => setState(() => age--),
                            ),
                            SizedBox(width: 10.0),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () => setState(() => age++),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomNavBar(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ResultPage(
                    height: height.toInt(),
                    weight: weight,
                  ),
                )),
            title: "CALCULATE",
          ),
        ],
      ),
    );
  }
}
