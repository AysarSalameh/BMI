import 'package:bmi/MyContainer.dart';
import 'package:bmi/constent.dart';
import 'package:bmi/input_page.dart';
import 'package:flutter/material.dart';
import 'package:bmi/ButtonBotom.dart';
import 'CalculatorBrain.dart';

class ReultPage extends StatelessWidget {
  ReultPage(
      {required this.interpretation,
      required this.bmiResult,
      required this.resultText}) {}
  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Calcuter"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 15),
              alignment: Alignment.bottomLeft,
              child: const Text("Your Result", style: KlabelLargstly),
            ),
          ),
          Expanded(
            flex: 5,
            child: MyContainer(
                colour: kActiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      resultText.toString(),
                      style: kResultTextStyle,
                    ),
                    Text(
                      bmiResult.toString(),
                      style: kBMITextStyle,
                    ),
                    Text(interpretation.toString(),
                        textAlign: TextAlign.center, style: kBodyTextStyle),
                  ],
                )),
          ),
          ButtonBotom(onTap: () => Navigator.pop(context), text: "Re-calculate")
        ],
      ),
    );
  }
}
