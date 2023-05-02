import 'package:flutter/material.dart';
import 'dart:math';
import 'package:bmi_calculator/constants.dart';

class BmiCalculatorBrain {
  BmiCalculatorBrain(this.height, this.weight);

  final double height;
  final int weight;
  double _bmi = 0;

  String calculateBMI() {
                          //pasar altura a mts
    _bmi = weight /  pow(height/100, 2);
    print(_bmi);
    return _bmi.toStringAsFixed(1);
  }

  Text getResult() {
    if(_bmi > 25) return Text('Overweight'.toUpperCase(), style: kTest.merge(const TextStyle(color: Colors.red),),);
    if(_bmi > 18.5) return Text('Normal'.toUpperCase(), style: kTest.merge(const TextStyle(color: Colors.green),),);
    return Text('Underweight'.toUpperCase(), style: kTest.merge(const TextStyle(color: Colors.orangeAccent),),);
  }

  String getInterpretation() {
    if(_bmi > 25) return 'You have a higher than normal body weight. Try to exercise more';
    if(_bmi > 18.5) return 'You have a normal body weight. Good job!';
    return 'You have a lower than normal body weight. You can ear a bit more';
  }
}