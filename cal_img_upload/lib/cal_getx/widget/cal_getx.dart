import 'package:get/get.dart';

class CalculatorController extends GetxController {
  var output = "0".obs;
  final _input = "".obs;
  final _num1 = 0.0.obs;
  final _num2 = 0.0.obs;
  final _operator = "".obs;

  var equation = "".obs; // This stores the full equation

  void input(String buttonText) {
    if (buttonText == "C") {
      clear();
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "x" ||
        buttonText == "÷" ||
        buttonText == "٪") {
      // Store the operator and first operand
      _operator.value = buttonText;
      _num1.value = double.tryParse(_input.value) ?? 0;
      equation.value = "${_input.value} $buttonText";
      _input.value = "";
    } else if (buttonText == "=") {
      // Store the second operand
      _num2.value = double.tryParse(_input.value) ?? 0;
      equation.value += " ${_input.value}";
      calculate();
    } else {
      _input.value += buttonText;
    }
    output.value = _input.value.isEmpty ? "0" : _input.value;
  }

  void clear() {
    // Reset everything to initial state
    _input.value = "";
    _num1.value = 0;
    _num2.value = 0;
    _operator.value = "";
    equation.value = ""; // Clear the equation
    output.value = "0";
  }

  void calculate() {
    double result = 0;
    // Perform calculation based on the operator
    switch (_operator.value) {
      case "+":
        result = _num1.value + _num2.value;
        break;
      case "-":
        result = _num1.value - _num2.value;
        break;
      case "x":
        result = _num1.value * _num2.value;
        break;
      case "÷":
        result = _num1.value / _num2.value;
        break;
      case "٪":
        result = _num1.value % _num2.value;
        break;
    }
    // Update the output with the result
    output.value = result.toString();
    // Also update the input for future operations
    _input.value = output.value;
  }
}
