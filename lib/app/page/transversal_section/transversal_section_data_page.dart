import 'package:beamshear/app/controller/data_controller.dart';
import 'package:beamshear/app/core/common/input_field.dart';
import 'package:beamshear/app/core/ui/helpers/constants.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../controller/drawer_controller.dart';
import '../../core/common/bottom_page_navigator.dart';
import '../../core/common/top_title.dart';
import '../../core/ui/helpers/enums.dart';
import '../../core/ui/helpers/parses.dart';

class TransversalSectionDataPage extends StatefulWidget {
  const TransversalSectionDataPage({super.key});

  @override
  State<TransversalSectionDataPage> createState() =>
      _TransversalSectionDataPageState();
}

class _TransversalSectionDataPageState
    extends State<TransversalSectionDataPage> {
  final hEC = TextEditingController();
  final bwEC = TextEditingController();
  final bfEC = TextEditingController();
  final cEC = TextEditingController();
  final dEC = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  var dataCalc = GetIt.I<DataController>();
  int currentPage = GetIt.I<CustomDrawerController>().value.page!.round();
  bool isRetangular = false;

  @override
  void initState() {
    isRetangular = dataCalc.value!.sectionType == null ||
        dataCalc.value!.sectionType == SectionType.rectangular;
    hEC.text = dataCalc.value!.h != null ? dataCalc.value!.h.toString() : '';
    bfEC.text = dataCalc.value!.bf != null ? dataCalc.value!.bf.toString() : '';
    bwEC.text = dataCalc.value!.bw != null ? dataCalc.value!.bw.toString() : '';
    cEC.text = dataCalc.value!.c != null ? dataCalc.value!.c.toString() : '';
    dEC.text = dataCalc.value!.d != null ? dataCalc.value!.d.toString() : '';

    super.initState();
  }

  @override
  void dispose() {
    hEC.dispose();
    bwEC.dispose();
    bfEC.dispose();
    cEC.dispose();
    dEC.dispose();
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
                  const SizedBox(
                    height: 8,
                  ),
                  TopTitle(
                      title: 'Dados',
                      subtitle: 'Seção Transversal',
                      type: isRetangular ? 'H' : 'T'),
                  SizedBox(
                    height: 200,
                    child: Image.asset(isRetangular
                        ? 'assets/images/square.png'
                        : 'assets/images/t_bfw.png'),
                  ),
                  (dataCalc.value!.sectionType != null &&
                          dataCalc.value!.sectionType == SectionType.t)
                      ? InputField(
                          label: 'bf',
                          suffix: const Text(Units.meters),
                          controller: bfEC,
                          validator: (value) {
                            if (dataCalc.value!.sectionType == SectionType.t) {
                              if (value.isEmpty) {
                                return 'o campo é obrigatório';
                              } else if (doubleParse(value) <= 0) {
                                return 'o valor deve ser positivo';
                              }
                            }
                            return null;
                          },
                        )
                      : Container(),
                  InputField(
                    label: 'h',
                    suffix: const Text(Units.meters),
                    controller: hEC,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'o campo é obrigatório';
                      } else if (doubleParse(value) <= 0) {
                        return 'o valor deve ser positivo';
                      }
                      return null;
                    },
                  ),
                  InputField(
                    label: 'bw',
                    suffix: const Text(Units.meters),
                    controller: bwEC,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'o campo é obrigatório';
                      } else if (doubleParse(value) <= 0) {
                        return 'o valor deve ser positivo';
                      }
                      return null;
                    },
                  ),
                  InputField(
                    label: 'c',
                    suffix: const Text(Units.cm),
                    controller: cEC,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'o campo é obrigatório';
                      } else if (doubleParse(value) <= 0) {
                        return 'o valor deve ser positivo';
                      }
                      return null;
                    },
                  ),
                  InputField(
                    label: 'd',
                    suffix: const Text(Units.meters),
                    controller: dEC,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'o campo é obrigatório';
                      } else if (doubleParse(value) <= 0) {
                        return 'o valor deve ser positivo';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 72,
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
                  bf: dataCalc.value!.sectionType == SectionType.t
                      ? doubleParse(bfEC.text)
                      : null,
                  h: doubleParse(hEC.text),
                  bw: doubleParse(bwEC.text),
                  c: doubleParse(cEC.text),
                  d: doubleParse(dEC.text),
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
