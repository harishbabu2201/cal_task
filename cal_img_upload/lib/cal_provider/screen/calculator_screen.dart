import 'package:cal_img_upload/cal_provider/logic/provider_cal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalculatorProviderScreen extends StatelessWidget {
  CalculatorProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final calculator = Provider.of<CalculatorProvider>(context);
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 8, top: 8, bottom: 8, right: 0),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text("Radical Start",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.w600)),
                  ],
                ),
                color: Color(0xFFF7F5FA),
                height: size.height * 0.1,
                width: double.infinity,
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  _buttonsWidget(context, ["C", "٪", "⌫", "÷"]),
                  _buttonsWidget(context, ["7", "8", "9", "x"]),
                  _buttonsWidget(context, ["4", "5", "6", "-"]),
                  _buttonsWidget(context, ["3", "2", "1", "+"]),
                  _buttonsWidget(context, [".", "0", "00", "="]),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 236, 231, 231),
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                alignment: Alignment.bottomRight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      calculator.output,
                      style: const TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      calculator.equation,
                      style: const TextStyle(
                        fontSize: 24,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buttonsWidget(BuildContext context, List<String> button) {
  return Row(
    children: button.asMap().entries.map((entry) {
      String btn = entry.value;

      Color buttonColor = _getButtonColor(btn);
      Color textColor = _getTextColor(btn);

      return GestureDetector(
        onTap: () {
          context.read<CalculatorProvider>().input(btn);
        },
        child: Container(
          margin: EdgeInsets.only(left: 20),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: buttonColor,
          ),
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.width * 0.18,
          child: Center(
            child: Text(
              btn,
              style: TextStyle(fontSize: 26, color: textColor),
            ),
          ),
        ),
      );
    }).toList(),
  );
}

Color _getButtonColor(String btnColor) {
  if (btnColor == "C" || btnColor == "٪" || btnColor == "٪") {
    return Colors.grey.shade300;
  } else if (btnColor == "÷" ||
      btnColor == "x" ||
      btnColor == "-" ||
      btnColor == "+") {
    return Colors.orange;
  } else if (btnColor == "=") {
    return const Color.fromARGB(255, 55, 2, 248);
  } else {
    return const Color.fromARGB(255, 233, 244, 251);
  }
}

Color _getTextColor(String button) {
  if (button == "C" || button == "٪" || button == "⌫") {
    return Colors.black;
  } else if (button == "=") {
    return Colors.white;
  } else if (button == "÷" || button == "x" || button == "-" || button == "+") {
    return Colors.white;
  } else {
    return Colors.black;
  }
}
