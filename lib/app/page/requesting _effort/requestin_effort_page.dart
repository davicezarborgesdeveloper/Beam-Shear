import 'package:beamshear/app/core/model/data_calc.dart';
import 'package:beamshear/app/core/styles/text_styles.dart';
import 'package:beamshear/app/core/ui/helpers/calculation_functions.dart';
import 'package:beamshear/app/core/ui/helpers/enums.dart';
import 'package:beamshear/app/page/requesting%20_effort/widget/result_tile.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../controller/data_controller.dart';
import '../../controller/drawer_controller.dart';
import '../../core/common/front_back_button.dart';
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
  double result = 0.0;
  late DataCalc dc;

  @override
  void initState() {
    dc = dataCalc.value!;
    result = switch (dataCalc.value?.loadType) {
      LoadType.distributed => calc.distributedLoadCalculation(dc.q!, dc.l!),
      LoadType.point => calc.pointLoadCalculation(dc.q!, dc.x!, dc.l!),
      LoadType.triangular => calc.triangularLoadCalculation(dc.q!, dc.l!),
      LoadType.cortante => dc.v!,
      _ => dc.v!,
    };
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
                  padding: const EdgeInsets.symmetric(vertical: 28),
                  child: Text(
                    'Esforços Solicitantes Maximos',
                    style: context.textStyles.textBold.copyWith(fontSize: 16),
                  ),
                ),
                TextResultTile(
                  title: 'Vsk max',
                  value: result,
                  unitType: 'KN',
                ),
                TextResultTile(
                  title: 'Vsd',
                  value: result * 1.4,
                  unitType: 'KN',
                ),
                const SizedBox(
                  height: 32,
                ),
                const Text(
                    '* De acordo com a NBR618/2003 o esforço solicitante de calculo é 40% maior que o esforço solicitante caracteristico.'),
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
                  value:
                      calc.cuttingValue2(dc.fck!, dc.bw!, dc.d!).ceilToDouble(),
                  unitType: 'KN',
                ),
                const ResultTile(
                  textApproved: 'Vsd ≤ Vdr2',
                  textDenied: 'Vsd > Vdr2',
                  standardPhrase:
                      'De acordo com o item 12.5.2 da norma NBR 6118/2023 as condições analiticas de segurança estabelecem que as resistências não podem ser menores que as solicitações e devem ser verificadas em relação a todos os estados-limites e todos os caregamentos especificados para o tipo de construção considerado, portanto devem ser reavaliados os parâmetros das etapas anteriores.',
                  approved: true,
                )
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 0, 8, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FrontBackButton(
                  icon: Icons.arrow_back,
                  onPressed: () {
                    GetIt.I<CustomDrawerController>()
                        .value
                        .jumpToPage(currentPage - 1);
                  },
                ),
                FrontBackButton(
                  icon: Icons.arrow_forward,
                  onPressed: () {
                    GetIt.I<CustomDrawerController>()
                        .value
                        .jumpToPage(currentPage + 1);
                  },
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
