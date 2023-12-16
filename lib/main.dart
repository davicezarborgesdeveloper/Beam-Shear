import 'dart:io';

import 'package:beamshear/app/controller/data_controller.dart';
import 'package:beamshear/app/controller/drawer_controller.dart';
import 'package:beamshear/app/core/model/data_calc.dart';
import 'package:beamshear/beam_shear_app.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows && !kIsWeb) {
    await DesktopWindow.setWindowSize(
      const Size(392.72727272727275 * 1.3, 803.6363636363636 * 1.3),
    );
  }
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await setupLocators();
  runApp(const BeamShearApp());
}

Future<void> setupLocators() async {
  GetIt.I.registerSingleton(
      CustomDrawerController(PageController(initialPage: 0)));
  // GetIt.I.registerSingleton(DataController(DataCalc.mock()));
  GetIt.I.registerSingleton(DataController(DataCalc.mock()));
}
