import 'package:beamshear/app/core/styles/colors_app.dart';
import 'package:beamshear/app/core/styles/text_styles.dart';
import 'package:beamshear/app/core/ui/helpers/enums.dart';
import 'package:beamshear/app/page/characteristics_materials/characteristics_materials_page.dart';
import 'package:beamshear/app/page/weight_load_data/widget/distributed_tile.dart';
import 'package:beamshear/app/page/weight_load_data/widget/point_tile.dart';
import 'package:beamshear/app/page/weight_load_data/widget/triangular_tile.dart';
import 'package:flutter/material.dart';

import '../../common/top_title.dart';

class WeightLoadDataPage extends StatefulWidget {
  const WeightLoadDataPage({super.key});

  @override
  State<WeightLoadDataPage> createState() => _WeightLoadDataPageState();
}

class _WeightLoadDataPageState extends State<WeightLoadDataPage> {
  LoadType? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade400,
        elevation: 4,
        title: Text(
          'Beam Shear',
          style: context.textStyles.textRegular
              .copyWith(fontSize: 28, color: ColorsApp.i.primary),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: ColorsApp.i.primary),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorsApp.i.primaryLight,
        foregroundColor: ColorsApp.i.primaryDark,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const CharacteristicsMaterialsPage(),
            ),
          );
        },
        child: const Icon(Icons.arrow_forward, color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: MediaQuery.sizeOf(context).width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              const TopTitle(title: 'Dados', subtitle: 'Carga (q)'),
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
                ),
              ),
              switch (dropdownValue) {
                LoadType.distributed => const DistributedTile(),
                LoadType.point => const PointTile(),
                LoadType.triangular => const TriangularTile(),
                _ => Container(),
              }
            ],
          ),
        ),
      ),
    );
  }
}
