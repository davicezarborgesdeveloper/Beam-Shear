import 'package:beamshear/app/controller/data_controller.dart';
import 'package:beamshear/app/core/styles/text_styles.dart';
import 'package:beamshear/app/core/ui/helpers/constants.dart';
import 'package:beamshear/app/page/characteristics_materials/widget/dialog_waning_calc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../controller/drawer_controller.dart';
import '../../core/common/bottom_page_navigator.dart';
import '../../core/common/input_field.dart';
import '../../core/common/top_title.dart';
import '../../core/ui/helpers/enums.dart';

class CharacteristicsMaterialsPage extends StatefulWidget {
  const CharacteristicsMaterialsPage({super.key});

  @override
  State<CharacteristicsMaterialsPage> createState() =>
      _CharacteristicsMaterialsPageState();
}

class _CharacteristicsMaterialsPageState
    extends State<CharacteristicsMaterialsPage> {
  SteelType? dropdownValue;
  int currentPage = GetIt.I<CustomDrawerController>().value.page!.round();
  final _formKey = GlobalKey<FormState>();
  final fckEC = TextEditingController();
  var dataCalc = GetIt.I<DataController>();

  @override
  void initState() {
    fckEC.text =
        dataCalc.value!.fck != null ? dataCalc.value!.fck.toString() : '';
    super.initState();
  }

  @override
  void dispose() {
    fckEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            width: MediaQuery.sizeOf(context).width,
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  const TopTitle(
                      title: 'Dados',
                      subtitle: 'Características dos matériais'),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, bottom: 12),
                    child: Text(
                      'Aço',
                      style: context.textStyles.textBold,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                    ),
                    child: DropdownButtonFormField(
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
                        ...SteelType.values.map((s) {
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
                        });
                      },
                      validator: (value) {
                        return value == null
                            ? 'O campo deve ser selecionado'
                            : null;
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 16, left: 8, bottom: 12),
                    child: Text(
                      'Concreto',
                      style: context.textStyles.textBold,
                    ),
                  ),
                  InputField(
                    label: 'fck',
                    suffix: const Text(Units.mPascal),
                    controller: fckEC,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'o campo é obrigatório';
                      } else if (double.parse(value) <= 0) {
                        return 'o valor deve ser positivo';
                      }
                      return null;
                    },
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
                dataCalc.value = dataCalc.value!.copyWith(
                  steel: dropdownValue,
                  fck: double.parse(fckEC.text),
                );
                await showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (_) => const DialogWaningCalc(),
                );
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
