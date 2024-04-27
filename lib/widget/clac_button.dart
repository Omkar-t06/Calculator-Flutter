import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CalcButton extends StatelessWidget {
  final String buttonValue;
  final Color buttonColor;
  final Color textColor;
  final VoidCallback buttontap;
  const CalcButton({
    super.key,
    required this.buttonValue,
    required this.buttonColor,
    required this.textColor,
    required this.buttontap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttontap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: buttonColor,
            child: Center(
              child: Text(
                buttonValue,
                style: TextStyle(color: textColor, fontSize: 18),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
