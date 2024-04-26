import 'package:flutter/rendering.dart';
import 'package:math_expressions/math_expressions.dart';

class SampleFixedPoint {
  double xI;
  double errorStopPoint;
  String equation = '';
  int? iterationLimit;

  List<double> x = [];
  List<double> fx = [];
  List<double> error = [];
  List<int> iterations = [];

  SampleFixedPoint({
    required this.xI,
    required this.errorStopPoint,
    this.iterationLimit = 0,
  });

  double calcFunction(double xValue) {
    Variable x = Variable('x');
    Parser p = Parser();
    Expression exp = p.parse(equation);
    ContextModel cm = ContextModel();
    cm.bindVariable(x, Number(xValue));
    return exp.evaluate(EvaluationType.REAL, cm);
  }

  /*void simplifyEquation() {
    // Handle leading negative sign more robustly
    equation = handleNegativeSign(equation);
  }

  String handleNegativeSign(String equation) {
    List<String> terms = equation.split(RegExp(r'[+\-]'));

    if (terms.isEmpty) {
      // Handle empty equation (optional, depends on your use case)
      return ""; // or throw an exception
    }

    // Check if the first term is a single "-" sign
    if (terms.length == 1 && terms[0] == "-") {
      // Single "-" sign: it's a negative constant term (e.g., "-5")
      return terms[0];
    }

    // Handle leading negative sign for equations with multiple terms
    if (terms[0] == "-") {
      if (terms.length > 1 && terms[1].isNotEmpty) {
        terms[1] = "-${terms[1]}"; // Negate the second term if it exists
      } else {
        // Handle single "-" followed by whitespace or empty term
        terms[0] = "-0"; // Convert to "-0" for consistency
      }
    } else {
      terms.insert(0, "+${terms[0]}"); // Prepend "+" for consistency
    }

    return terms.join('+'); // Join terms back with "+" signs
  }*/

  void calcSampleFixedPoint() {
    //simplifyEquation();
    if (iterationLimit != 0) {
      for (int i = 0; i < iterationLimit!; i++) { // 0 = x = fx = error
        iterations.add(i);
        x.add(xI);
        fx.add(calcFunction(x[i]));

        if (i == 0) {
          error.add(100.0); // Initial error set to 100
        } else {
          error.add(((x[i] - x[i - 1]) / x[i]).abs() * 100);
        }
        xI = fx[i];
      }
    } else {
      int i = -1;
      do {
        i++;
        iterations.add(i);
        x.add(xI);
        fx.add(calcFunction(x[i]));

        if (i == 0) {
          error.add(100.0); // Initial error set to 100
        } else {
          error.add(((x[i] - x[i - 1]) / x[i]).abs() * 100);
        }
        xI = fx[i];
      } while (error.last >= errorStopPoint);
    }
  }
}
