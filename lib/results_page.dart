import 'package:bmitest/constants.dart';
import 'package:bmitest/reusablecard.dart';
import 'package:flutter/material.dart';
import 'bottom_button.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage(
      {super.key,
      required this.bmiResult,
      required this.resultText,
      required this.interpretation});
  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('calculator'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
                child: Container(
                    padding: const EdgeInsets.all(15.0),
                    alignment: Alignment.bottomLeft,
                    child: const Text(
                      'Your Result',
                      style: kTitleTextStyle,
                    ))),
            Expanded(
              flex: 5,
              child: ReusableCard(
                  kInactive,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        resultText.toUpperCase(),
                        style: kResultTextStyle,
                      ),
                      Text(
                        bmiResult,
                        style: kBmiTextStyle,
                      ),
                      Text(
                        interpretation,
                        style: kBmiBodyTextStyle,
                        textAlign: TextAlign.center,
                      )
                    ],
                  )),
            ),
            BottomButton(
              buttonTitle: ('RE- CALCULATE'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ));
  }
}
