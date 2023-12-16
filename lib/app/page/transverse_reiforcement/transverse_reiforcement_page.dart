import 'package:beamshear/app/core/styles/text_styles.dart';
import 'package:beamshear/app/page/requesting%20_effort/widget/result_tile.dart';
import 'package:flutter/material.dart';

import '../../core/common/drawer/custom_drawer.dart';
import '../../core/common/text_result_tile.dart';
import '../../core/styles/colors_app.dart';
import '../../core/ui/helpers/enums.dart';
import '../servicer_shear_force/servicer_shear_force_page.dart';

class TransverseReiforcementPage extends StatefulWidget {
  const TransverseReiforcementPage({super.key});

  @override
  State<TransverseReiforcementPage> createState() =>
      _TransverseReiforcementPageState();
}

class _TransverseReiforcementPageState
    extends State<TransverseReiforcementPage> {
  GaugeDiameter? dropdownValue;

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
      drawer: const CustomDrawer(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorsApp.i.primaryLight,
        foregroundColor: ColorsApp.i.primaryDark,
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => const ServicerShearForcePage(),
            ),
          );
        },
        child: const Icon(Icons.arrow_forward, color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  'Armadura transversal mínima',
                  style: context.textStyles.textMedium.copyWith(fontSize: 16),
                ),
              ),
              const TextResultTile(
                title: 'Asw min',
                value: 50.5,
                unitType: 'cm²/m',
              ),
              const Divider(
                height: 16,
                thickness: 1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'Detalhamento da armadura transversal',
                  style: context.textStyles.textMedium.copyWith(fontSize: 16),
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
                      style:
                          context.textStyles.textRegular.copyWith(fontSize: 14),
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
                  });
                },
              ),
              const SizedBox(
                height: 8,
              ),
              const TextResultTile(
                title: 'Ase min',
                value: 50.5,
                unitType: 'cm²/m',
              ),
              const TextResultTile(
                title: 'S',
                value: 50.5,
                unitType: 'cm',
              ),
              const Divider(
                height: 24,
                thickness: 1,
              ),
              Text(
                'Espaçamento máximo',
                style: context.textStyles.textBold.copyWith(fontSize: 16),
              ),
              const ResultTile(
                textApproved: 'Vsd <= 0.67 * Vdr2',
                textDenied: 'Vsd > 0.67 * Vdr2',
                standardPhrase: 'Frase Norma',
                approved: true,
              ),
              const Divider(
                height: 8,
                thickness: 1,
              ),
              const TextResultTile(
                title: 'Smax',
                value: 50.5,
                unitType: 'cm',
              ),
              const ResultTile(
                textApproved: 'Smax > S',
                textDenied: 'Smax < S',
                standardPhrase: 'Frase Norma',
                approved: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
