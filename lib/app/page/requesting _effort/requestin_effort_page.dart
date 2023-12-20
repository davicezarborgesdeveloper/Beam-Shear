import 'package:beamshear/app/core/common/bottom_page_navigator.dart';
import 'package:beamshear/app/core/model/data_calc.dart';
import 'package:beamshear/app/core/styles/text_styles.dart';
import 'package:beamshear/app/core/ui/helpers/calculation_functions.dart';
import 'package:beamshear/app/core/ui/helpers/enums.dart';
import 'package:beamshear/app/page/requesting%20_effort/widget/result_tile.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../controller/data_controller.dart';
import '../../controller/drawer_controller.dart';
import '../../core/common/text_result_tile.dart';

class RequestinEffortPage extends StatefulWidget {
  const RequestinEffortPage({super.key});

  @override
  State<RequestinEffortPage> createState() => _RequestinEffortPageState();
}

class _RequestinEffortPageState extends State<RequestinEffortPage> {
  int currentPage = GetIt.I<CustomDrawerController>().value.page!.round();
  var dataCalc = GetIt.I<DataController>();
  final CalculationFunctions calc = CalculationFunctions();
  double vsd = 0.0;
  double vrd2 = 0.0;
  late DataCalc dc;

  @override
  void initState() {
    dc = dataCalc.value!;

    setCalcs();
    super.initState();
  }

  void setCalcs() {
    if (dc.h != null && dc.bw != null && dc.c != null && dc.d != null) {
      dataCalc.value = dataCalc.value!.copyWith(
          vsk: switch (dataCalc.value?.loadType) {
        LoadType.distributed => calc.distributedLoadCalculation(dc.q!, dc.l!),
        LoadType.point => calc.pointLoadCalculation(dc.q!, dc.x!, dc.l!),
        LoadType.triangular => calc.triangularLoadCalculation(dc.q!, dc.l!),
        LoadType.cortante => dc.vsk!,
        _ => dc.vsk!,
      });
    }

    dataCalc.value = dataCalc.value!.copyWith(vsd: dataCalc.value!.vsk! * 1.4);
    dataCalc.value = dataCalc.value!.copyWith(
        vrd2: calc
            .cuttingValue2(dc.fck!, dc.bw!, dc.d!, dc.stirrupAngle!)
            .roundToDouble());
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
                  padding: const EdgeInsets.symmetric(vertical: 28),
                  child: Text(
                    'Esforços Solicitantes Máximos',
                    style: context.textStyles.textBold.copyWith(fontSize: 16),
                  ),
                ),
                TextResultTile(
                  title: 'Vsk max',
                  value: dataCalc.value!.vsk!,
                  unitType: 'KN',
                ),
                TextResultTile(
                  title: 'Vsd',
                  value: dataCalc.value!.vsd!,
                  unitType: 'KN',
                ),
                const SizedBox(
                  height: 32,
                ),
                const Text(
                    '* De acordo com a NBR6118/2023 o esforço solicitante de calculo é 40% maior que o esforço solicitante caracteristico.'),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  child: Divider(),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    'Verificação da biela de concreto comprimido',
                    style: context.textStyles.textBold.copyWith(fontSize: 16),
                  ),
                ),
                TextResultTile(
                  title: 'Vrd2',
                  value: dataCalc.value!.vrd2!,
                  unitType: 'KN',
                ),
                ResultTile(
                  textApproved: 'Vsd ≤ Vdr2',
                  textDenied: 'Vsd > Vdr2',
                  standardPhrase:
                      'De acordo com o item 12.5.2 da norma NBR 6118/2023 as condições analiticas de segurança estabelecem que as resistências não podem ser menores que as solicitações e devem ser verificadas em relação a todos os estados-limites e todos os caregamentos especificados para o tipo de construção considerado, portanto devem ser reavaliados os parâmetros das etapas anteriores.',
                  approvedPhrase: 'Não há esmagamento da biela de compressão',
                  approved: dataCalc.value!.vsd! <= dataCalc.value!.vrd2!,
                )
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
