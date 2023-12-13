import 'package:beamshear/app/common/text_result_tile.dart';
import 'package:beamshear/app/core/styles/colors_app.dart';
import 'package:beamshear/app/core/styles/text_styles.dart';
import 'package:flutter/material.dart';

import '../requesting _effort/widget/result_tile.dart';
import '../stirrup_details/stirrup_details_page.dart';

class ServicerShearForcePage extends StatelessWidget {
  const ServicerShearForcePage({super.key});

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
              builder: (_) => const StirrupDetailsPage(),
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
                'Força cortante de serviço',
                style: context.textStyles.textMedium.copyWith(fontSize: 16),
              ),
            ),
            TextResultTile(
              title: 'Vrmin',
              value: 50.5.toString(),
              unitType: 'KN',
            ),
            const ResultTile(
              textApproved: 'Vrmin >= Vskmax',
              textDenied: 'Vrmin < Vsrmax',
              standardPhrase: 'Frase Norma',
              approvedPhrase: 'A área mínima pode ser adotada em toda a viga.',
              approved: true,
            ),
          ],
        ),
      )),
    );
  }
}
