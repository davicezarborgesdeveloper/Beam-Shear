import 'package:beamshear/app/core/styles/text_styles.dart';
import 'package:beamshear/app/core/ui/helpers/enums.dart';
import 'package:beamshear/app/page/weight_load_data/widget/cutting_value_page.dart';
import 'package:beamshear/app/page/weight_load_data/widget/distributed_tile.dart';
import 'package:beamshear/app/page/weight_load_data/widget/point_tile.dart';
import 'package:beamshear/app/page/weight_load_data/widget/triangular_tile.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../controller/data_controller.dart';
import '../../controller/drawer_controller.dart';
import '../../core/common/bottom_page_navigator.dart';
import '../../core/common/top_title.dart';
import '../../core/ui/helpers/parses.dart';

class WeightLoadDataPage extends StatefulWidget {
  const WeightLoadDataPage({super.key});

  @override
  State<WeightLoadDataPage> createState() => _WeightLoadDataPageState();
}

class _WeightLoadDataPageState extends State<WeightLoadDataPage> {
  LoadType? dropdownValue;
  int currentPage = GetIt.I<CustomDrawerController>().value.page!.round();
  final qEC = TextEditingController();
  final lEC = TextEditingController();
  final xEC = TextEditingController();
  final vEC = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var dataCalc = GetIt.I<DataController>();
  @override
  void initState() {
    dropdownValue = dataCalc.value!.loadType;
    qEC.text = dataCalc.value!.q != null ? dataCalc.value!.q.toString() : '';
    lEC.text = dataCalc.value!.l != null ? dataCalc.value!.l.toString() : '';
    xEC.text = dataCalc.value!.x != null ? dataCalc.value!.x.toString() : '';
    vEC.text =
        dataCalc.value!.vsk != null ? dataCalc.value!.vsk.toString() : '';
    super.initState();
  }

  @override
  void dispose() {
    qEC.dispose();
    lEC.dispose();
    xEC.dispose();
    vEC.dispose();
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
                  const TopTitle(title: 'Dados', subtitle: 'Carga ou Cortante'),
                  const SizedBox(height: 16),
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
                        ...LoadType.values.map((s) {
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
                  switch (dropdownValue) {
                    LoadType.distributed => DistributedTile(
                        type: dropdownValue, controllers: [qEC, lEC]),
                    LoadType.point => PointTile(
                        type: dropdownValue, controllers: [qEC, xEC, lEC]),
                    LoadType.triangular => TriangularTile(
                        type: dropdownValue, controllers: [qEC, lEC]),
                    LoadType.cortante => CuttingValuePage(
                        type: dropdownValue,
                        controller: vEC,
                      ),
                    _ => Container(),
                  }
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
                  q: dropdownValue != LoadType.cortante
                      ? doubleParse(qEC.text)
                      : null,
                  l: dropdownValue != LoadType.cortante
                      ? doubleParse(lEC.text)
                      : null,
                  x: dropdownValue == LoadType.point
                      ? doubleParse(xEC.text)
                      : null,
                  vsk: dropdownValue == LoadType.cortante
                      ? doubleParse(vEC.text)
                      : null,
                  loadType: dropdownValue,
                );
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
