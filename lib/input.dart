import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusablecard.dart';
import 'icon_card.dart';
import 'constants.dart';
import 'results_page.dart';
import 'bottom_button.dart';
import 'calculator_brain.dart';

enum Gender { male, female }

// Color maleC = inactive;
// Color femaleC = inactive;

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  InputPageState createState() => InputPageState();
}

class InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 19;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment:
            CrossAxisAlignment.stretch, // Ensure horizontal stretching
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    child: ReusableCard(
                      selectedGender == Gender.male ? kActive : kInactive,
                      const IconCard(
                          icon: FontAwesomeIcons.mars, label: "MALE"),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    child: ReusableCard(
                      selectedGender == Gender.female ? kActive : kInactive,
                      const IconCard(
                          icon: FontAwesomeIcons.venus, label: "FEMALE"),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
                kInactive,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("HEIGHT", style: kLabelTextStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(height.toString(), style: kTextStyleW900),
                        const Text(
                          'cm',
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          inactiveTrackColor: const Color(0xff8d8e98),
                          thumbColor: const Color(0xffeb1555),
                          thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 15.0),
                          overlayShape: const RoundSliderOverlayShape(
                              overlayRadius: 30.0),
                          overlayColor: const Color(0x29eb1555),
                          activeTrackColor: Colors.white),
                      child: Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          }),
                    ),
                  ],
                )),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                      kInactive,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'WEIGHT',
                            style: kLabelTextStyle,
                          ),
                          Text(weight.toString(), style: kTextStyleW900),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                  backgroundColor: const Color(0xff4c4f5e),
                                  child: const Icon(
                                    FontAwesomeIcons.minus,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  }),
                              const SizedBox(width: 10.0),
                              FloatingActionButton(
                                  backgroundColor: const Color(0xff4c4f5e),
                                  child: const Icon(
                                    FontAwesomeIcons.plus,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  }),
                            ],
                          )
                        ],
                      )),
                ),
                Expanded(
                  child: ReusableCard(
                      kInactive,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'AGE',
                            style: kLabelTextStyle,
                          ),
                          Text(age.toString(), style: kTextStyleW900),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                backgroundColor: const Color(0xff4c4f5e),
                                child: const Icon(
                                  FontAwesomeIcons.minus,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(
                                width: 10.0,
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                backgroundColor: const Color(0xff4c4f5e),
                                child: const Icon(
                                  FontAwesomeIcons.plus,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          )
                        ],
                      )),
                ),
              ],
            ),
          ),
          BottomButton(
            onTap: () {
              CalculatorBrain calc = CalculatorBrain(height, weight);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultsPage(
                          bmiResult: calc.calculateBMI(),
                          resultText: calc.getResult(),
                          interpretation: calc.getInterpretation())));
            },
            buttonTitle: ('CALCULATE'),
          ),
        ],
      ),
    );
  }
}
