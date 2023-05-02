import 'package:bmi_calculator/components/large_action_button.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/models/result_screen_arguments.dart';
import 'package:flutter/material.dart';

import 'package:bmi_calculator/constants.dart';

class ResultsPage extends StatelessWidget {
  final Text? result;
  final String bmi;
  final String interpretation;
  const ResultsPage({this.result, this.bmi = '', this.interpretation = '', Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ResultsScreenArguments;

    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Results')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ReusableCard(
              colour: kactiveCardBg,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  args.result,
                  Text(args.bmi, style: kBMITextStyle),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(args.interpretation, style: kInterpretationTextStyle, textAlign: TextAlign.center,),
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const LargeActionButton(text: 'RE-CALCULATE')
          )
        ],
      ),
    );
  }
}
