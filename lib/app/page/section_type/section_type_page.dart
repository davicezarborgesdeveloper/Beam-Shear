import 'package:beamshear/app/core/styles/colors_app.dart';
import 'package:beamshear/app/core/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../controller/data_controller.dart';
import '../../core/common/logo.dart';
import '../../core/model/data_calc.dart';
import '../base/widget/button_selection.dart';

class SectionTypePage extends StatefulWidget {
  const SectionTypePage({super.key});

  @override
  State<SectionTypePage> createState() => _SectionTypePageState();
}

class _SectionTypePageState extends State<SectionTypePage> {
  @override
  void initState() {
    GetIt.I<DataController>().value = DataCalc();

    super.initState();
  }

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
            color: Colors.white,
            child: const Logo(),
          ),
        ],
      ),
    );
  }
}
