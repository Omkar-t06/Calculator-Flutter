import 'package:flutter/material.dart';

class TextContainer extends StatelessWidget {
  final String value;
  final double fontSize;
  final Color color;
  const TextContainer(
      {super.key,
      required this.value,
      this.fontSize = 48,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      alignment: Alignment.bottomRight,
      child: Text(
        value,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.end,
      ),
    );
  }
}
