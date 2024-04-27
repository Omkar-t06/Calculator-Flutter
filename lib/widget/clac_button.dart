import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CalcButton extends StatelessWidget {
  final String buttonValue;
  final Color textColor;
  final VoidCallback buttontap;
  const CalcButton({
    super.key,
    required this.buttonValue,
    required this.textColor,
    required this.buttontap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttontap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            buttonValue,
            style: TextStyle(color: textColor, fontSize: 24),
          ),
        ),
      ),
    );
  }
}
