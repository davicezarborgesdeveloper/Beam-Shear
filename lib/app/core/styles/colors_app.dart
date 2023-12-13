import 'package:flutter/material.dart';

class ColorsApp {
  static ColorsApp? _instance;
  // Avoid self isntance
  ColorsApp._();
  static ColorsApp get i {
    _instance ??= ColorsApp._();
    return _instance!;
  }

  Color get primaryLight => const Color(0XFFD81B60);
  Color get primary => const Color(0XFFAD1457);
  Color get primaryDark => const Color(0XFF880E4F);

  Color get secondaryLight => const Color(0XFFa9f5d4);
  Color get secondary => const Color(0XFF52eba8);
  Color get secondaryDark => const Color(0XFF108e57);

  Color get bg => Colors.grey.shade100;
}

extension ColorsAppExtensions on BuildContext {
  ColorsApp get colors => ColorsApp.i;
}
