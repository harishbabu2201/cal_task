import 'package:cal_img_upload/cal_getx/widget/cal_getx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalGetxScreen extends StatelessWidget {
  CalGetxScreen({super.key});
  final CalculatorController controller = Get.put(CalculatorController());
  @override
  Widget build(BuildContext context) {
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
                  _buttonsWidget(context, ["C", "٪", "⌫", "÷"], controller),
                  _buttonsWidget(context, ["7", "8", "9", "x"], controller),
                  _buttonsWidget(context, ["4", "5", "6", "-"], controller),
                  _buttonsWidget(context, ["3", "2", "1", "+"], controller),
                  _buttonsWidget(context, [".", "0", "00", "="], controller),
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
                    Obx(
                      () => Text(
                        controller.output.value,
                        style: const TextStyle(
                            fontSize: 48,
                            fontWeight:
                                FontWeight.bold), // Style for the result
                      ),
                    ),
                    Obx(
                      () => Text(
                        controller.equation.value,
                        style: const TextStyle(
                            fontSize: 24,
                            color: Colors.grey), // Style for the equation
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

Widget _buttonsWidget(BuildContext context, List<String> button,
    CalculatorController controller) {
  return Row(
    children: button.asMap().entries.map((entry) {
      int index = entry.key; // Accessing the index
      String btn = entry.value; // Accessing the button value

      Color buttonColor = _getButtonColor(btn);
      Color textColor = _getTextColor(btn);

      return GestureDetector(
        onTap: () {
          controller.input(btn);
          print('Button $btn at index $index was tapped');
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

// Widget _buttonsWidget(BuildContext context, List<String> button,
//     CalculatorController controller) {
//   return Row(
//       children: button.map((btn) {
//     Color buttonColor = _getButtonColor(btn);
//     Color textColor = _getTextColor(btn);

//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 10),
//       child: GestureDetector(
//         onTap: () => controller.input(btn),
//         child: Container(
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             color: buttonColor,
//           ),
//           height: MediaQuery.of(context).size.height * 0.1,
//           width: MediaQuery.of(context).size.width * 0.18,
//           child: Center(
//               child: Text(
//             btn,
//             style: TextStyle(fontSize: 26, color: textColor),
//           )),
//         ),
//       ),
//     );
//   }).toList());
// }

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
