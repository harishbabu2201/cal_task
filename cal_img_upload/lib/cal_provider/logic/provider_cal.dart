import 'package:flutter/material.dart';

class CalculatorProvider extends ChangeNotifier {
  String _output = "0";
  String _input = "";
  double _num1 = 0;
  double _num2 = 0;
  String _operator = "";

  String _equation = ""; // To store the equation

  String get output => _output;
  String get equation => _equation; // Getter for the equation

  void input(String buttonText) {
    if (buttonText == "C") {
      _clear();
    } else if (buttonText == "⌫") {
      // Backspace
      _backspace();
    } else if (buttonText == "00") {
      // Double zero
      _input += "00";
    } else if (buttonText == ".") {
      // Decimal dot
      if (!_input.contains(".")) {
        _input += ".";
      }
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "x" ||
        buttonText == "÷" ||
        buttonText == "٪") {
      _operator = buttonText;
      _num1 = double.tryParse(_input) ?? 0;
      // Update the equation with the first number and operator
      _equation = "$_input $buttonText";
      _input = ""; // Clear the input for the next number
    } else if (buttonText == "=") {
      _num2 = double.tryParse(_input) ?? 0;
      // Append the second operand before the calculation
      _equation += " $_input";
      _calculate(); // Perform the calculation
    } else {
      _input += buttonText;
    }

    _output = _input.isEmpty ? "0" : _input;
    notifyListeners(); // Notify listeners to update UI
  }

  void _clear() {
    _output = "0";
    _input = "";
    _num1 = 0;
    _num2 = 0;
    _operator = "";
    _equation = ""; // Clear the equation as well
    notifyListeners();
  }

  void _backspace() {
    if (_input.isNotEmpty) {
      _input = _input.substring(0, _input.length - 1);
      _output = _input.isEmpty ? "0" : _input;
      notifyListeners();
    }
  }

  void _calculate() {
    double result = 0;
    switch (_operator) {
      case "+":
        result = _num1 + _num2;
        break;
      case "-":
        result = _num1 - _num2;
        break;
      case "x":
        result = _num1 * _num2;
        break;
      case "÷":
        result = _num1 / _num2;
        break;
      case "٪":
        result = _num1 % _num2;
        break;
    }
    _output = result.toString();
    _input = _output;
  }
}
