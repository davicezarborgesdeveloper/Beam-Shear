import 'package:beamshear/app/core/styles/colors_app.dart';
import 'package:beamshear/app/core/styles/text_styles.dart';
import 'package:beamshear/app/page/report/report_page.dart';
import 'package:flutter/material.dart';

import '../../common/text_result_tile.dart';

class StirrupDetailsPage extends StatelessWidget {
  const StirrupDetailsPage({super.key});

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
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => const ReportPage()));
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
                  'Detalhamento de estribos',
                  style: context.textStyles.textSemiBold.copyWith(fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'Número total de estribos',
                  style: context.textStyles.textMedium.copyWith(fontSize: 16),
                ),
              ),
              TextResultTile(
                title: 'N',
                value: 50.5.toString(),
                unitType: 'estribos',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  '* Maior precisão do espaçamento',
                  style: context.textStyles.textMedium.copyWith(fontSize: 16),
                ),
              ),
              TextResultTile(
                title: 'Sp',
                value: 50.5.toString(),
                unitType: 'Cm',
              ),
              const Divider(
                height: 24,
                thickness: 1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'Comprimento dos estribos',
                  style: context.textStyles.textMedium.copyWith(fontSize: 20),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(vertical: 8),
              //   child: Text(
              //     'Comprimento horizontal',
              //     style: context.textStyles.textMedium.copyWith(fontSize: 16),
              //   ),
              // ),
              TextResultTile(
                title: 'Comprimento horizontal',
                value: 50.5.toString(),
                unitType: 'Cm',
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(vertical: 8),
              //   child: Text(
              //     'Comprimento vertical',
              //     style: context.textStyles.textMedium.copyWith(fontSize: 16),
              //   ),
              // ),
              TextResultTile(
                title: 'Comprimento vertical',
                value: 50.5.toString(),
                unitType: 'Cm',
              ),
              // Padding(
              // padding: const EdgeInsets.symmetric(vertical: 8),
              // child: Text(
              // 'Comprimento total do estribo',
              // style: context.textStyles.textMedium.copyWith(fontSize: 16),
              // ),
              // ),
              TextResultTile(
                title: 'Comprimento total',
                value: 50.5.toString(),
                unitType: 'Cm',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
