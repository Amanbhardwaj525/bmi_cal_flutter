class CalculateBrain {
  CalculateBrain({this.height, this.weight});
  final int height;
  final int weight;

  double BMICalculate() {
    double h = height / 100;
    h = h * h;
    return weight / h;
  }

  String WeightRating(double bmi) {
    if (bmi < 18.5) {
      return 'UnderWeight';
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return 'Normal';
    } else {
      return 'OverWeight';
    }
  }

  String MessageText(double bmi) {
    if (bmi < 18.5) {
      return 'You BMI result is quite low, you should eat more.';
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return 'You have a normal body Weight.Good job!';
    } else {
      return 'You have higher than normal body weight.Try to exercise more';
    }
  }
}
