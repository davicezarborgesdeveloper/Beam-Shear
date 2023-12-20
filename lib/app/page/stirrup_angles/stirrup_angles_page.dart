import 'package:beamshear/app/core/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../controller/data_controller.dart';
import '../../controller/drawer_controller.dart';
import '../../core/common/bottom_page_navigator.dart';
import '../../core/common/input_field.dart';
import '../../core/common/top_title.dart';

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

  @override
  void initState() {
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
                  InputField(
                    label: 'Ângulo',
                    suffix: const Text('°'),
                    controller: angleEC,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'o campo é obrigatório';
                      } else if (double.parse(value) < 30 ||
                          double.parse(value) > 45) {
                        return 'o valor deve estar entre 30 e 45 graus';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 32),
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
                            'O modelo II admite diagonais de compressão inclinadas de θ em relação ao eixo longitudinal do elemento estrutural, com θ variável entre 30° e 45°. Admite ainda que a parcela complementar de Vc sofra redução com o aumento de Vsd',
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
                  stirrupAngle: double.parse(angleEC.text),
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
