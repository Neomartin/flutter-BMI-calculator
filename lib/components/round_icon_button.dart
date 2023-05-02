import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({required this.icon, required this.operation, Key? key}) : super(key: key);

  final IconData icon;
  final VoidCallback operation;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: operation,
      elevation: 6.0,
      textStyle: const TextStyle(color: Colors.white),
      fillColor: Colors.white12,
      shape: const CircleBorder(),
      constraints: const BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      child: Icon(icon),
    );
  }
}