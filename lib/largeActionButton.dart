import 'package:flutter/material.dart';
import 'constants.dart';

class LargeActionButton extends StatelessWidget {
  final String text;
  final double height;
  const LargeActionButton({ required this.text, this.height = 80.0, super.key });

  // final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: EdgeInsets.only(bottom: 20.0),
      width: double.infinity,
      color: kprimaryColor,
      child: Center(child: Text(text, style: kLargeButtonText,)),
    );
  }
}
