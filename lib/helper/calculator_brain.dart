import 'package:ideal_weight_calculator/pages/home.dart';

class CalculatorBrain {
  final Gender gender;
  final double height;
  final int age;

  CalculatorBrain({
    required this.gender,
    required this.height,
    required this.age,
  });

  double getResult() {
    if (gender == Gender.MALE) {
      return getMaleResult();
    } else {
      return getFemaleResult();
    }
  }

  double getFemaleResult() {
    return height - 100 - ((height - 150) / 2);
  }

  double getMaleResult() {
    return height - 100 - ((height - 150) / 4);
  }
}
