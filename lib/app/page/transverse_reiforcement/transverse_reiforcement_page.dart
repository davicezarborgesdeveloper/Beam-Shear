import 'package:beamshear/app/core/styles/text_styles.dart';
import 'package:beamshear/app/page/requesting%20_effort/widget/result_tile.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../controller/data_controller.dart';
import '../../controller/drawer_controller.dart';
import '../../core/common/bottom_page_navigator.dart';
import '../../core/common/text_result_tile.dart';
import '../../core/styles/colors_app.dart';
import '../../core/ui/helpers/calculation_functions.dart';
import '../../core/ui/helpers/enums.dart';

class TransverseReiforcementPage extends StatefulWidget {
  const TransverseReiforcementPage({super.key});

  @override
  State<TransverseReiforcementPage> createState() =>
      _TransverseReiforcementPageState();
}

class _TransverseReiforcementPageState
    extends State<TransverseReiforcementPage> {
  GaugeDiameter? dropdownValue;
  int currentPage = GetIt.I<CustomDrawerController>().value.page!.round();
  var dataCalc = GetIt.I<DataController>();
  final CalculationFunctions calc = CalculationFunctions();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    dropdownValue = dataCalc.value!.diameter;
    dataCalc.value = dataCalc.value!.copyWith(
        asw90: calc.calcAsw90(dataCalc.value!.vsw!, dataCalc.value!.d!,
            dataCalc.value!.steel!.value, dataCalc.value!.stirrupAngle!),
        aswmin: calc.calcAswMin(dataCalc.value!.fck!,
            dataCalc.value!.steel!.value, dataCalc.value!.bw!));
    dataCalc.value = dataCalc.value!.copyWith(
        smax: calc.calcSmax(
            dataCalc.value!.vsd! <= 0.67 * dataCalc.value!.vrd2!,
            dataCalc.value!.d!));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      'Armadura de cálculo',
                      style: context.textStyles.textBold.copyWith(fontSize: 16),
                    ),
                  ),
                  TextResultTile(
                    title: 'Asw90',
                    value: dataCalc.value!.asw90!,
                    decimal: 3,
                    unitType: 'cm²/m',
                  ),
                  TextResultTile(
                    title: 'Asw min',
                    value: dataCalc.value!.aswmin!,
                    decimal: 3,
                    unitType: 'cm²/m',
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: ColorsApp.i.primary,
                              ),
                            ),
                            child: Text(
                              (dataCalc.value!.asw90! > dataCalc.value!.aswmin!
                                      ? dataCalc.value!.asw90!
                                      : dataCalc.value!.asw90! <
                                              dataCalc.value!.aswmin!
                                          ? dataCalc.value!.aswmin!
                                          : 0)
                                  .toStringAsFixed(3),
                              style: context.textStyles.textMedium.copyWith(
                                  fontSize: 20, color: ColorsApp.i.primary),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            'Adotamos o maior valor',
                            style: context.textStyles.textMedium.copyWith(
                                fontSize: 16, color: ColorsApp.i.primary),
                          ),
                          const Divider(
                            thickness: 1,
                            height: 32,
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      'Cálculo dos espaçamentos',
                      style: context.textStyles.textBold.copyWith(fontSize: 16),
                    ),
                  ),
                  ResultTile(
                    textApproved: 'Vsd ≤ 0.67 * Vdr2',
                    textDenied: 'Vsd > 0.67 * Vdr2',
                    standardPhrase: '',
                    text: '',
                    approved:
                        dataCalc.value!.vsd! <= 0.67 * dataCalc.value!.vrd2!,
                  ),
                  TextResultTile(
                    title: 'Smax',
                    value: dataCalc.value!.smax!,
                    unitType: 'cm',
                  ),
                  const Divider(
                    height: 16,
                    thickness: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      'Número de barras',
                      style: context.textStyles.textBold.copyWith(fontSize: 16),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      'Diâmetro do estribo',
                      style: context.textStyles.textRegular,
                    ),
                  ),
                  DropdownButtonFormField(
                    value: dropdownValue,
                    items: [
                      DropdownMenuItem(
                        value: null,
                        child: Text(
                          'Selecione',
                          style: context.textStyles.textRegular
                              .copyWith(fontSize: 14),
                        ),
                      ),
                      ...GaugeDiameter.values.map((s) {
                        return DropdownMenuItem(
                          value: s,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * .6,
                            child: Text(
                              s.name,
                              overflow: TextOverflow.ellipsis,
                              style: context.textStyles.textRegular
                                  .copyWith(fontSize: 14),
                            ),
                          ),
                        );
                      })
                    ],
                    onChanged: (value) {
                      setState(() {
                        dropdownValue = value;
                        var nbars = calc.calcNBars(
                          dataCalc.value!.asw90!,
                          dropdownValue!.value,
                        );
                        dataCalc.value = dataCalc.value!.copyWith(
                          diameter: dropdownValue,
                          nbars: nbars,
                          spacing: calc.calcSpacing(nbars),
                        );
                      });
                    },
                    validator: (value) {
                      return value == null
                          ? 'O campo deve ser selecionado'
                          : null;
                    },
                  ),
                  TextResultTile(
                    title: 'N° Barras',
                    value: dataCalc.value!.nbars ?? 0.0,
                    decimal: 0,
                    unitType: 'un',
                  ),
                  const Divider(
                    height: 20,
                    thickness: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      'Espaçamento',
                      style: context.textStyles.textBold.copyWith(fontSize: 16),
                    ),
                  ),
                  TextResultTile(
                    title: 'S',
                    value: dataCalc.value!.spacing ?? 0.0,
                    decimal: 2,
                    unitType: 'cm',
                  ),
                  if (dataCalc.value!.spacing != null)
                    ResultTile(
                      textApproved: 'S < Smax',
                      textDenied: 'S > Smax',
                      standardPhrase: 'Utilizar S',
                      approvedPhrase: 'Utilizar Smax',
                      text: '',
                      approved:
                          dataCalc.value!.spacing! < dataCalc.value!.smax!,
                    ),
                  const SizedBox(
                    height: 100,
                  ),
                ],
              ),
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
              if (_formKey.currentState!.validate()) {
                GetIt.I<CustomDrawerController>()
                    .value
                    .jumpToPage(currentPage + 1);
              }
            },
          ),
        )
      ],
    );
  }
}
