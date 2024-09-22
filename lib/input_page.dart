import 'package:flutter/material.dart';
import 'iconColumn.dart';
import 'MyContainer.dart';
import 'package:bmi/constent.dart';
import 'result_page.dart';
import 'package:bmi/ButtonBotom.dart';
import 'CalculatorBrain.dart';

enum Gender {
  male,
  female,
}

Gender? seleectgender;
int hieght = 100;
int age = 10;
int weight = 50;

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        seleectgender = Gender.male;
                      });
                    },
                    child: MyContainer(
                      colour: seleectgender == Gender.male
                          ? kActiveCardColour
                          : kInactiveCardColour,
                      cardChild: iconColumn(icon: Icons.male, gender: "MALE"),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        seleectgender = Gender.female;
                      });
                    },
                    child: MyContainer(
                        colour: seleectgender == Gender.female
                            ? kActiveCardColour
                            : kInactiveCardColour,
                        cardChild: const iconColumn(
                          icon: Icons.female,
                          gender: "FEMALE",
                        )),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: MyContainer(
              colour: const Color(0xFF1D1E33),
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("HEIGHT", style: KlabelTexyStlye),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(hieght.toString(), style: KlabelNumberStlye),
                      const Text(
                        "cm",
                        style: KlabelTexyStlye,
                      )
                    ],
                  ),
                  Slider(
                    activeColor: const Color(0xFFEB1555),
                    inactiveColor: const Color(0xFF8E8D98),
                    value: hieght.roundToDouble(),
                    min: 100.0,
                    max: 220.0,
                    onChanged: (double newHieght) {
                      setState(() {
                        hieght = newHieght.round();
                      });
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    colour: const Color(0xFF1D1E33),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Age", style: KlabelTexyStlye),
                        Text(age.toString(), style: KlabelNumberStlye),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              style: const ButtonStyle(
                                shape: MaterialStatePropertyAll(
                                  CircleBorder(),
                                ),
                                backgroundColor: MaterialStatePropertyAll(
                                  Color(0xFF4C4F5E),
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              child: const Icon(Icons.add,
                                  size: 30, color: Colors.white),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            TextButton(
                              style: const ButtonStyle(
                                shape: MaterialStatePropertyAll(
                                  CircleBorder(),
                                ),
                                backgroundColor: MaterialStatePropertyAll(
                                  Color(0xFF4C4F5E),
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              child: const Icon(Icons.remove, size: 30),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    colour: Color(0xFF1D1E33),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("WEIGHT", style: KlabelTexyStlye),
                        Text(weight.toString(), style: KlabelNumberStlye),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              style: const ButtonStyle(
                                shape: MaterialStatePropertyAll(
                                  CircleBorder(),
                                ),
                                backgroundColor: MaterialStatePropertyAll(
                                  Color(0xFF4C4F5E),
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              child: const Icon(Icons.add,
                                  size: 30, color: Colors.white),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            TextButton(
                              style: const ButtonStyle(
                                shape: MaterialStatePropertyAll(
                                  CircleBorder(),
                                ),
                                backgroundColor: MaterialStatePropertyAll(
                                  Color(0xFF4C4F5E),
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              child: const Icon(Icons.remove, size: 30),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          ButtonBotom(
            text: "Calculate",
            onTap: () {
              CalculatorBrain clac =
                  CalculatorBrain(height: hieght, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ReultPage(
                      bmiResult: clac.calculateBMI(),
                      resultText: clac.getResult(),
                      interpretation: clac.getInterpretation(),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
