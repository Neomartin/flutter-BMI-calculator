import 'package:flutter/material.dart';

const TextStyle textStyle = TextStyle(fontSize: 18.0, color: Color(0xFCF9F4FF));

class IconContent extends StatelessWidget {
  final String text;
  final IconData icon;

  const IconContent({required this.icon, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon, size: 80.0),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          text,
          style: textStyle,
        )
      ],
    );
  }
}