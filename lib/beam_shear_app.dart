import 'package:flutter/material.dart';

import 'app/core/ui/theme/theme_config.dart';
import 'app/page/base/base_page.dart';

class BeamShearApp extends StatelessWidget {
  const BeamShearApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Beam Shear',
      theme: ThemeConfig.theme,
      home: const BasePage(),
    );
  }
}
