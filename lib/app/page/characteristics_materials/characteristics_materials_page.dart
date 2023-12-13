import 'package:beamshear/app/core/styles/colors_app.dart';
import 'package:beamshear/app/core/styles/text_styles.dart';
import 'package:flutter/material.dart';

import '../../common/input_field.dart';
import '../../common/top_title.dart';
import '../../core/ui/helpers/enums.dart';
import 'widget/dialog_waning_calc.dart';

class CharacteristicsMaterialsPage extends StatefulWidget {
  const CharacteristicsMaterialsPage({super.key});

  @override
  State<CharacteristicsMaterialsPage> createState() =>
      _CharacteristicsMaterialsPageState();
}

class _CharacteristicsMaterialsPageState
    extends State<CharacteristicsMaterialsPage> {
  SteelType? dropdownValue;

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
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) => const DialogWaningCalc());
        },
        child: const Icon(Icons.arrow_forward, color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: MediaQuery.sizeOf(context).width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              const TopTitle(
                  title: 'Dados', subtitle: 'Características dos matériais'),
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
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, left: 8, bottom: 12),
                child: Text(
                  'Concreto',
                  style: context.textStyles.textBold,
                ),
              ),
              const InputField(
                label: 'fck',
                suffix: Text('MPa'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
