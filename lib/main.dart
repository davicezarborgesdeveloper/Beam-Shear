import 'dart:io';

import 'package:beamshear/beam_shear_app.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows && !kIsWeb) {
    await DesktopWindow.setWindowSize(
      const Size(360 * 1.3, 600 * 1.3),
    );
  }
  runApp(const BeamShearApp());
}
