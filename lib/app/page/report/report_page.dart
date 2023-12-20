import 'package:beamshear/app/controller/drawer_controller.dart';
import 'package:beamshear/app/core/styles/text_styles.dart';
import 'package:beamshear/app/core/ui/helpers/constants.dart';
import 'package:beamshear/app/page/report/widget/report_check_tile.dart';
import 'package:beamshear/app/page/report/widget/report_tile.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../controller/data_controller.dart';
import '../../core/common/bottom_page_navigator.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  int currentPage = GetIt.I<CustomDrawerController>().value.page!.round();
  var dataCalc = GetIt.I<DataController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            child: Column(
              children: [
                Text(
                  'Relatório',
                  style: context.textStyles.textBold.copyWith(fontSize: 24),
                ),
                const SizedBox(height: 16),
                ReportTile(
                    text: 'Vskmax',
                    value: dataCalc.value!.vsk!,
                    decimal: 3,
                    unit: Units.knewton),
                ReportTile(
                    text: 'Vsd',
                    value: dataCalc.value!.vsd!,
                    decimal: 3,
                    unit: Units.knewton),
                ReportTile(
                    text: 'Vrd2',
                    value: dataCalc.value!.vrd2!,
                    decimal: 3,
                    unit: Units.knewton),
                const ReportCheckTile(text: 'Vsd <= Vrd2'),
                const Divider(
                  height: 16,
                  thickness: 1,
                ),
                ReportTile(text: 'Vc', value: dataCalc.value!.vc!, unit: 'kN'),
                ReportTile(
                    text: 'Vsw', value: dataCalc.value!.vsw!, unit: 'kN'),
                const Divider(
                  height: 16,
                  thickness: 1,
                ),
                ReportTile(
                    text: 'Asw90',
                    value: dataCalc.value!.asw90!,
                    decimal: 3,
                    unit: 'cm²/m'),
                ReportTile(
                    text: 'Aswmin',
                    value: dataCalc.value!.aswmin!,
                    decimal: 3,
                    unit: 'cm²/m'),
                ReportCheckTile(
                    text: dataCalc.value!.asw90! > dataCalc.value!.aswmin!
                        ? 'Asw90'
                        : (dataCalc.value!.asw90! < dataCalc.value!.aswmin!)
                            ? 'Aswmin'
                            : 'Asw90'),
                const Divider(
                  height: 16,
                  thickness: 1,
                ),
                ReportCheckTile(
                    text: dataCalc.value!.vsd! <= 0.67 * dataCalc.value!.vrd2!
                        ? 'Vsd ≤ 0.67 * Vdr2'
                        : 'Vsd > 0.67 * Vdr2'),
                ReportTile(
                  text: 'Smax',
                  value: dataCalc.value!.smax!,
                  unit: 'cm',
                  decimal: 1,
                ),
                const Divider(
                  height: 16,
                  thickness: 1,
                ),
                ReportTile(
                    text: 'Diâmetro do estribo',
                    value: dataCalc.value!.diameter!.value,
                    decimal: 2,
                    unit: 'cm'),
                ReportTile(
                    text: 'N° Barras',
                    value: dataCalc.value!.nbars!,
                    decimal: 0,
                    unit: 'un'),
                const Divider(
                  height: 16,
                  thickness: 1,
                ),
                ReportTile(
                    text: 'Espaçamento',
                    value: dataCalc.value!.spacing!,
                    decimal: 2,
                    unit: 'cm'),
                ReportCheckTile(
                    text: dataCalc.value!.spacing! < dataCalc.value!.smax!
                        ? 'S < Smax'
                        : 'S > Smax'),
                const Divider(
                  height: 16,
                  thickness: 1,
                ),
                ReportTile(
                    text: 'Comprimento Horizontal',
                    value: dataCalc.value!.ch!,
                    decimal: 2,
                    unit: 'cm'),
                ReportTile(
                    text: 'Comprimento Vertical',
                    value: dataCalc.value!.cv!,
                    decimal: 2,
                    unit: 'cm'),
                ReportTile(
                  text: 'Comprimento Total',
                  value: dataCalc.value!.ct!,
                  unit: 'cm',
                  decimal: 2,
                ),
                const SizedBox(
                  height: 64,
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: BottomPageNavigator(
            onPressedBack: () {
              GetIt.I<CustomDrawerController>()
                  .value
                  .jumpToPage(currentPage - 1);
            },
          ),
        )
      ],
    );
  }
}
