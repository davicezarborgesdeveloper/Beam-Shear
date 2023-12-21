import 'package:beamshear/app/core/styles/colors_app.dart';
import 'package:beamshear/app/core/styles/text_styles.dart';
import 'package:flutter/material.dart';

import '../../core/common/logo.dart';
import '../base/widget/button_selection.dart';

class SectionTypePage extends StatelessWidget {
  const SectionTypePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width * .8,
            padding: const EdgeInsets.only(top: 16),
            child: Text(
              'Escolha o tipo de seção transversal',
              style: context.textStyles.textBold
                  .copyWith(fontSize: 20, color: ColorsApp.i.primaryDark),
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(),
          const ButtonSelection(),
          const Spacer(),
          Container(
            color: Colors.grey.shade200,
            child: const Logo(),
          ),
        ],
      ),
    );
  }
}
