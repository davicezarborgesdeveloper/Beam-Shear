import 'dart:math';

class CalculationFunctions {
  double pointLoadCalculation(double q, double x, double l) {
    double v1 = (q * x) / l;
    double v2 = (q * ((l - x).abs())) / l;
    return (v1 > v2)
        ? v1
        : (v1 < v2)
            ? v2
            : v1;
  }

  double distributedLoadCalculation(double q, double l) {
    return (q * l) / 2;
  }

  double triangularLoadCalculation(double q, double l) {
    double v1 = (q * l) / 6;
    double v2 = (q * l) / 3;
    return (v1 > v2)
        ? v1
        : (v1 < v2)
            ? v2
            : v1;
  }

  double cuttingValue2(double fck, double bw, double d) {
    double alpha = 1 - (fck / 250);
    double fcd = fck / 1.4;
    double result = 0.27 * alpha * fcd * (bw * d * 10) * sin(60 * (pi / 180));
    return result;
  }
}
