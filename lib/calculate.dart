import 'dart:math';

class Calculator {
  late double weight;
  late double height;
  double bmi = 0.0;

  Calculator(this.weight, this.height);

  String calculateBMI() {
    bmi = weight / pow((height / 100), 2);

    return bmi.toStringAsFixed(1);
  }

  String resultText() {
    if (bmi < 18.5) {
      return 'น้ำหนักน้อยเกินไป';
    } else if (bmi < 23) {
      return 'น้ำหนักปกติ';
    } else if (bmi < 25) {
      return 'น้ำหนักเกิน (ท้วม)';
    } else if (bmi < 30) {
      return 'อ้วนระดับ 1 (อ้วนระยะเริ่มต้น)';
    } else if (bmi < 40) {
      return 'อ้วนระดับ 2 (อ้วนมาก)';
    } else {
      return 'อ้วนระดับ 3 (อ้วนระดับรุนแรงมาก)';
    }
  }
}
