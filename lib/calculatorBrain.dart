import 'dart:math';

class CalculatorBrain {
  late int height;
  late int weight;
  double _bmi = 0;
  CalculatorBrain(this.height, this.weight);
  String calculate() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi > 25) {
      return 'OVERWEIGHT';
    } else if (_bmi > 18.5) {
      return 'NORMAL';
    }
    return 'UNDERWEHIGHT';
  }

  String getIntepretation() {
    if (_bmi > 25) {
      return 'You have a higer than a normal body weight.Try to exercise more.';
    } else if (_bmi > 18.5) {
      return 'You\'re healthy! maintain your diet and exercises.';
    }
    return 'You\'re less than what a healthy person should weight. Try changing your diet.';
  }
}
