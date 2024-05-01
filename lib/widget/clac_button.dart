import 'package:calculator/btn_values.dart';
import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  final String buttonValue;
  final Color btnColor;
  final VoidCallback buttontap;
  const CalcButton({
    super.key,
    required this.buttonValue,
    required this.btnColor,
    required this.buttontap,
  });

  @override
  Widget build(BuildContext context) {
    if (buttonValue == Btn.del) {
      return IconButton(
          onPressed: buttontap,
          icon: const Icon(
            Icons.backspace_outlined,
            color: Colors.deepOrange,
          ));
    } else if (buttonValue == Btn.unfold) {
      return IconButton(
        icon: Icon(Icons.unfold_more, color: btnColor, size: 24),
        onPressed: buttontap,
      );
    } else {
      return TextButton(
          onPressed: buttontap,
          child: Text(
            buttonValue,
            style: TextStyle(color: btnColor, fontSize: 24),
          ));
    }
  }
}
