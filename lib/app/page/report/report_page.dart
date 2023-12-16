import 'package:beamshear/app/core/styles/text_styles.dart';
import 'package:beamshear/app/page/report/widget/report_check_tile.dart';
import 'package:beamshear/app/page/report/widget/report_tile.dart';
import 'package:flutter/material.dart';

import '../../core/common/drawer/custom_drawer.dart';
import '../../core/styles/colors_app.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade400,
        elevation: 4,
        title: Text(
          'Beam Shear',
          style: context.textStyles.textRegular
              .copyWith(fontSize: 28, color: ColorsApp.i.primary),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: ColorsApp.i.primary),
      ),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          child: Column(
            children: [
              Text(
                'Relatório',
                style: context.textStyles.textBold.copyWith(fontSize: 24),
              ),
              const SizedBox(height: 16),
              const ReportTile(text: 'Vskmax', value: 10, unit: 'KN'),
              const ReportTile(text: 'Vsd', value: 10, unit: 'KN'),
              const ReportTile(text: 'Vrd2', value: 10, unit: 'KN'),
              const ReportCheckTile(text: 'Vsd <= Vrd2'),
              const ReportTile(text: 'Aswmin', value: 10, unit: 'cm²/m'),
              const ReportTile(text: 'Ase', value: 10, unit: 'cm²/m'),
              const ReportTile(text: 'S', value: 10, unit: 'cm'),
              const ReportCheckTile(text: 'Vsd <= 0,67 * Vrd2'),
              const ReportTile(text: 'Smax', value: 10, unit: 'cm'),
              const ReportCheckTile(text: 'smax > S'),
              const ReportTile(text: 'Vrmin', value: 10, unit: 'KN'),
              const ReportCheckTile(text: 'Vrmin => Vskmax'),
              const ReportTile(text: 'N', value: 10, unit: 'estribos'),
              const ReportTile(text: 'Sp', value: 10, unit: 'cm'),
              const ReportTile(text: 'Ch', value: 10, unit: 'cm'),
              const ReportTile(text: 'Cv', value: 10, unit: 'cm'),
              const ReportTile(text: 'Ct', value: 10, unit: 'cm'),
            ],
          ),
        ),
      ),
    );
  }
}
