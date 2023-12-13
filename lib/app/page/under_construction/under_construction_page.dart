import 'package:beamshear/app/core/styles/text_styles.dart';
import 'package:flutter/material.dart';

import '../../core/styles/colors_app.dart';

class UnderConstructionPage extends StatelessWidget {
  const UnderConstructionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 4,
        title: Text(
          'Beam Shear',
          style: context.textStyles.textRegular
              .copyWith(fontSize: 28, color: ColorsApp.i.primary),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: ColorsApp.i.primary),
      ),
      body: Center(
        child: SizedBox(
          width: double.infinity,
          child: Image.asset(
            'assets/images/unde_construction2.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
