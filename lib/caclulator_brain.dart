import 'dart:ffi';
import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});
  final int height;
  final int weight;

  double _Bmi;

  String calculateBMI() {
    final double metre = height / 100;
    _Bmi = weight / pow(metre, 2);
    return _Bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_Bmi > 23.5) {
      return 'Fat ';
    } else if (_Bmi < 18.5) {
      return 'Skinny';
    } else {
      return 'Ideal';
    }
  }

  String interpitations() {
    if (_Bmi > 23.5) {
      return 'You need to go to the gym + follow a suitable diet.';
    } else if (_Bmi < 18.5) {
      return 'You need to workout more and gain some weight.';
    } else {
      return 'You\'re in your ideal shape , just keep on eating healthy.';
    }
  }
}
