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

  double cuttingValue2(double fck, double bw, double d, double angle) {
    double result = 0.54 *
        (1 - (fck / 250)) *
        (fck * 1000 / 1.4) *
        bw *
        d *
        pow(sin(angle * (pi / 180)), 2) *
        (1 / tan(angle * (pi / 180)));
    return result;
  }

  double serviceCutting(
      double fck, double bw, double d, double vrd2, double vsd) {
    double vc0 = ((0.6 * ((0.21 * pow(fck, 2 / 3)) / 1.4)) * bw * d) * 1000;
    double vc = vc0 * ((vrd2 - vsd) / (vrd2 - vc0));
    return vc;
  }

  double calcAsw90(double vsw, double d, double steel, double angle) {
    return vsw / (0.90 * d * (steel / 1.15) * (1 / tan(angle * (pi / 180))));
  }

  double calcAswMin(double fck, double steel, double bw) {
    double fctm = (0.30 * pow(fck, 2 / 3)) / 10;

    return 20 * (fctm / steel) * bw * 100;
  }

  double calcSmax(bool isTrue, double d) {
    return getMenor(d, isTrue ? 0.6 : 0.3, isTrue ? 30 : 20);
  }

  double getMenor(double d, double multiply, double comparative) {
    double value = (d * multiply) * 100;
    return value < comparative
        ? value
        : (value > comparative)
            ? comparative
            : value;
  }

  double calcNBars(double asw90, double diameter) {
    double nbars = asw90 / (2 * ((pi * pow(diameter, 2)) / 4));
    return nbars.ceilToDouble();
  }

  double calcSpacing(double nBars) {
    return 100 / nBars;
  }

  double horizontalLength(double bw, double c, double diameter) {
    return (bw * 100) - 2 * (c + diameter);
  }

  double verticalLength(double h, double c, double diameter) {
    return (h * 100) - 2 * (c + diameter);
  }

  double totalLength(double ch, double cv) {
    return 2 * (ch + cv) + 10;
  }
}
