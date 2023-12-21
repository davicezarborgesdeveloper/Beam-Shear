import 'package:beamshear/app/controller/drawer_controller.dart';
import 'package:beamshear/app/core/common/bottom_page_navigator.dart';
import 'package:beamshear/app/core/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../controller/data_controller.dart';
import '../../core/common/text_result_tile.dart';
import '../../core/ui/helpers/calculation_functions.dart';

class StirrupDetailsPage extends StatefulWidget {
  const StirrupDetailsPage({super.key});

  @override
  State<StirrupDetailsPage> createState() => _StirrupDetailsPageState();
}

class _StirrupDetailsPageState extends State<StirrupDetailsPage> {
  int currentPage = GetIt.I<CustomDrawerController>().value.page!.round();
  var dataCalc = GetIt.I<DataController>();
  final CalculationFunctions calc = CalculationFunctions();

  @override
  void initState() {
    if (dataCalc.value!.h != null &&
        dataCalc.value!.bw != null &&
        dataCalc.value!.c != null &&
        dataCalc.value!.d != null) {
      var ch = calc.horizontalLength(dataCalc.value!.bw!, dataCalc.value!.c!,
          dataCalc.value!.diameter!.value);
      var cv = calc.verticalLength(dataCalc.value!.h!, dataCalc.value!.c!,
          dataCalc.value!.diameter!.value);
      dataCalc.value = dataCalc.value!
          .copyWith(ch: ch, cv: cv, ct: calc.totalLength(ch, cv));
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 32),
                  child: Text(
                    'Comprimento dos estribos',
                    style: context.textStyles.textBold.copyWith(fontSize: 16),
                  ),
                ),
                const Divider(
                  height: 32,
                  thickness: 1,
                ),
                TextResultTile(
                  title: 'Comprimento horizontal',
                  value: dataCalc.value!.ch ?? 0.0,
                  decimal: 2,
                  unitType: 'cm',
                ),
                const SizedBox(height: 16),
                TextResultTile(
                  title: 'Comprimento vertical',
                  value: dataCalc.value!.cv ?? 0.0,
                  decimal: 2,
                  unitType: 'cm',
                ),
                const SizedBox(height: 16),
                TextResultTile(
                  title: 'Comprimento total',
                  value: dataCalc.value!.ct ?? 0.0,
                  decimal: 2,
                  unitType: 'cm',
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
            onPressedForwad: () async {
              GetIt.I<CustomDrawerController>()
                  .value
                  .jumpToPage(currentPage + 1);
            },
          ),
        )
      ],
    );
  }
}
