import 'package:beamshear/app/core/styles/colors_app.dart';
import 'package:beamshear/app/core/styles/text_styles.dart';
import 'package:beamshear/app/core/ui/helpers/enums.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../controller/data_controller.dart';
import '../../controller/drawer_controller.dart';
import '../../core/common/bottom_page_navigator.dart';
import '../../core/common/input_field.dart';
import '../../core/common/text_result_tile.dart';
import '../../core/common/top_title.dart';
import '../../core/ui/helpers/parses.dart';

class StirrupAnglesPage extends StatefulWidget {
  const StirrupAnglesPage({super.key});

  @override
  State<StirrupAnglesPage> createState() => _StirrupAnglesPageState();
}

class _StirrupAnglesPageState extends State<StirrupAnglesPage> {
  int currentPage = GetIt.I<CustomDrawerController>().value.page!.round();
  final angleEC = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var dataCalc = GetIt.I<DataController>();
  bool isRetangular = false;
  double defineAngle = 0;
  double angle = 0;

  @override
  void initState() {
    isRetangular = dataCalc.value!.sectionType == null ||
        dataCalc.value!.sectionType == SectionType.rectangular;

    if (!isRetangular) {
      defineAngle = (dataCalc.value!.bf! / dataCalc.value!.bw!).roundToDouble();
      angle = defineAngle >= 5 && defineAngle <= 12 ? 45 : 30;
    }
    angleEC.text = dataCalc.value!.stirrupAngle != null
        ? dataCalc.value!.stirrupAngle.toString()
        : '';

    super.initState();
  }

  @override
  void dispose() {
    angleEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              width: MediaQuery.sizeOf(context).width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 16),
                  const TopTitle(
                      title: 'Dados',
                      subtitle: 'Ângulo da biela de compressão'),
                  const SizedBox(height: 16),
                  isRetangular
                      ? InputField(
                          label: 'Ângulo',
                          suffix: const Text('°'),
                          controller: angleEC,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'o campo é obrigatório';
                            } else if (doubleParse(value) < 30 ||
                                double.parse(value) > 45) {
                              return 'o valor deve estar entre 30 e 45 graus';
                            }
                            return null;
                          },
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Definição do ângulo',
                              style: context.textStyles.textBold
                                  .copyWith(fontSize: 16),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            TextResultTile(
                              title: 'bf/bw',
                              value: defineAngle,
                              unitType: 'cm',
                            ),
                          ],
                        ),
                  const SizedBox(height: 32),
                  if (!isRetangular)
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Aviso',
                                style: context.textStyles.textRegular,
                              ),
                              const Icon(
                                Icons.warning,
                                color: Colors.amber,
                              ),
                            ],
                          ),
                          Text(
                            'Caso bf/bw esteja entre:',
                            style: context.textStyles.textRegular,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.circle,
                                size: 6,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                '1 à 6 o ângulo será 30°',
                                style: context.textStyles.textRegular,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.circle,
                                size: 6,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                '6 à 12 o ângulo será 45°',
                                style: context.textStyles.textRegular,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Aviso',
                                style: context.textStyles.textRegular,
                              ),
                              const Icon(
                                Icons.warning,
                                color: Colors.amber,
                              ),
                            ],
                          ),
                          Text(
                            'Utilizando o modelo de cálculo II',
                            style: context.textStyles.textRegular,
                          ),
                          Text(
                            'O modelo II admite diagonais de compressão inclinadas de θ em relação ao eixo longitudinal do elemento estrutural, com θ variável entre 30° e 45°. Admite ainda que a parcela complementar de Vc sofra redução com o aumento de Vsd.',
                            style: context.textStyles.textRegular,
                          ),
                        ]),
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
            onPressedForwad: () {
              if (_formKey.currentState!.validate()) {
                dataCalc.value = dataCalc.value!.copyWith(
                  stirrupAngle:
                      isRetangular ? doubleParse(angleEC.text) : angle,
                );
                FocusScope.of(context).unfocus();
                GetIt.I<CustomDrawerController>()
                    .value
                    .jumpToPage(currentPage + 1);
              }
            },
          ),
        ),
      ],
    );
  }
}
