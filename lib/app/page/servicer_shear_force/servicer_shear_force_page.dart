import 'package:beamshear/app/core/common/bottom_page_navigator.dart';
import 'package:beamshear/app/core/common/text_result_tile.dart';
import 'package:beamshear/app/core/styles/colors_app.dart';
import 'package:beamshear/app/core/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../controller/data_controller.dart';
import '../../controller/drawer_controller.dart';
import '../../core/model/data_calc.dart';
import '../../core/ui/helpers/calculation_functions.dart';

class ServicerShearForcePage extends StatefulWidget {
  const ServicerShearForcePage({super.key});

  @override
  State<ServicerShearForcePage> createState() => _ServicerShearForcePageState();
}

class _ServicerShearForcePageState extends State<ServicerShearForcePage> {
  int currentPage = GetIt.I<CustomDrawerController>().value.page!.round();
  final CalculationFunctions calc = CalculationFunctions();
  var dataCalc = GetIt.I<DataController>();
  late DataCalc dc;
  @override
  void initState() {
    dc = dataCalc.value!;
    dataCalc.value = dataCalc.value!.copyWith(
        vc: calc.serviceCutting(dc.fck!, dc.bw!, dc.d!, dc.vrd2!, dc.vsd!));
    dataCalc.value =
        dataCalc.value!.copyWith(vsw: dc.vsd! - dataCalc.value!.vc!);
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
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  'Força cortante de serviço',
                  style: context.textStyles.textBold.copyWith(fontSize: 16),
                ),
              ),
              TextResultTile(
                title: 'Vc',
                value: dataCalc.value!.vc!,
                decimal: 3,
                unitType: 'KN',
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 20),
                  child: Text(
                    'Parcela em que o concreto consegue resistir.',
                    style: context.textStyles.textRegular
                        .copyWith(color: ColorsApp.i.primary),
                  ),
                ),
              ),
              const Divider(thickness: 1),
              TextResultTile(
                title: 'Vsw',
                value: dataCalc.value!.vsw!,
                decimal: 3,
                unitType: 'KN',
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 20),
                  child: Text(
                    'Valor que a armadura precisa resistir.',
                    style: context.textStyles.textRegular
                        .copyWith(color: ColorsApp.i.primary),
                  ),
                ),
              ),
              // const ResultTile(
              //   textApproved: 'Vsw ≥ Vskmax',
              //   textDenied: 'Vsw < Vsrmax',
              //   standardPhrase: 'Frase Norma',
              //   approvedPhrase:
              //       'A área mínima pode ser adotada em toda a viga.',
              //   approved: true,
              // ),
            ],
          ),
        )),
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
