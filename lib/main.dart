import 'package:calculator/btn_values.dart';
import 'package:calculator/widget/clac_button.dart';
import 'package:calculator/widget/text_container.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String userInput = "0";
  String outputExp = "";
  bool isCalculated = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            //Output Screen
            Expanded(
                child: SingleChildScrollView(
              reverse: true,
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                TextContainer(
                    value: userInput,
                    fontSize: isCalculated ? 24 : 48,
                    color: Colors.white),
                if (outputExp.isNotEmpty)
                  TextContainer(
                    value: outputExp,
                    fontSize: isCalculated ? 48 : 24,
                    color: isCalculated ? Colors.white : Colors.grey,
                  )
              ]),
            )),
            const Padding(
              padding: EdgeInsets.only(right: 8.0, left: 8.0),
              child: Divider(height: 0, thickness: 2),
            ),
            //Button Grid
            Expanded(
                flex: 2,
                child: Container(
                  color: Colors.black87,
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4),
                      itemCount: Btn.buttonValues.length,
                      itemBuilder: (context, index) {
                        return CalcButton(
                            buttonValue: Btn.buttonValues[index],
                            btnColor: getBtnColor(Btn.buttonValues[index]),
                            buttontap: () =>
                                onButtonTap(Btn.buttonValues[index]));
                      }),
                ))
          ],
        ),
      ),
    );
  }

  void onButtonTap(String value) {
    if (value == Btn.clr) {
      setState(() {
        userInput = "0";
        outputExp = "";
        isCalculated = false;
      });
    } else if (value == Btn.del) {
      setState(() {
        isCalculated = false;
        if (userInput.isEmpty) {
          // Reset both userInput and outputExp to "0" if userInput is empty
          userInput = "0";
          outputExp = "";
        } else {
          // Remove the last character from userInput and update outputExp
          if (userInput.length > 1) {
            userInput = userInput.substring(0, userInput.length - 1);
            outputExp = userInput;
          } else {
            userInput = "0";
            outputExp = "";
          }
        }
      });
    } else if (value == Btn.calculate) {
      setState(() {
        evalExp();
      });
    } else if (value == Btn.per) {
      try {
        double percent = double.parse(userInput) / 100;
        setState(() {
          userInput = percent.toString();
          outputExp = userInput;
        });
      } catch (e) {
        setState(() {
          outputExp = "Invalid Expression";
        });
      }
    } else if (value == Btn.unfold) {
    } else {
      setState(() {
        if (userInput == "0") {
          userInput = value;
        } else {
          userInput += value;
          outputExp = userInput;
        }
      });
    }
  }

  evalExp() {
    try {
      String userExp = userInput;
      userExp = userExp.replaceAll("×", "*");
      userExp = userExp.replaceAll("÷", "/");
      Parser p = Parser();
      Expression outExp = p.parse(userExp);
      ContextModel cm = ContextModel();
      double eval = outExp.evaluate(EvaluationType.REAL, cm);
      outputExp = eval.toString().endsWith(".0")
          ? eval.toString().replaceAll(".0", "")
          : eval.toString();
      isCalculated = true;
    } catch (e) {
      outputExp = "Invalid Expression";
    }
  }

  Color getBtnColor(String value) {
    return [
      Btn.del,
      Btn.clr,
      Btn.per,
      Btn.multiply,
      Btn.add,
      Btn.subtract,
      Btn.divide,
      Btn.calculate,
      Btn.unfold,
    ].contains(value)
        ? Colors.deepOrange
        : Colors.white;
  }
}
