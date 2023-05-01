import 'package:bmi_calculator/LargeActionButton.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hola')),
      body: Column(
        children: [
          Expanded(
            child: ReusableCard(
              colour: kactiveCardBg,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('OVERWEIGHT', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),),
                  Container(
                      child: Text('28.5', style: kResultTextStyle,),
                  ),
                  Text('Lorem text inmpusn morten ligere vindici cataruchi moroshi katafuchi akatama wakalaca')
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: LargeActionButton(text: 'RE-CALCULATE')
          )
        ],
      ),
    );
  }
}
