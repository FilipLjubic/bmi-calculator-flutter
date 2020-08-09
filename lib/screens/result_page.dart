import 'package:bmi_calculator/utils/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/utils/constants.dart';
import 'package:bmi_calculator/utils/reusable_card.dart';
import 'package:bmi_calculator/utils/calculator_brain.dart';

class ResultPage extends StatelessWidget {
  final int height;
  final int weight;

  ResultPage({@required this.height, @required this.weight});

  @override
  Widget build(BuildContext context) {
    var _calculator = CalculatorBrain(height: height, weight: weight);
    String _bmi = _calculator.calculateBMI();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                "Your Result",
                style: bigTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: activeCardColor,
              childWidget: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    _calculator.getResult().toUpperCase(),
                    style: resultTextStyle,
                  ),
                  Text(
                    _bmi,
                    style: kBMITextStyle,
                  ),
                  Text(
                    _calculator.getInterpretation(),
                    style: bodyTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          BottomNavBar(
            onTap: () => Navigator.pop(context),
            title: "RE-CALCULATE",
          ),
        ],
      ),
    );
  }
}
