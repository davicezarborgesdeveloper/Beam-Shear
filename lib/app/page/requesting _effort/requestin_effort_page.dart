import 'package:beamshear/app/core/styles/text_styles.dart';
import 'package:beamshear/app/page/requesting%20_effort/widget/result_tile.dart';
import 'package:flutter/material.dart';

import '../../core/styles/colors_app.dart';
import '../transverse_reiforcement/transverse_reiforcement_page.dart';
import '../../common/text_result_tile.dart';

class RequestinEffortPage extends StatelessWidget {
  const RequestinEffortPage({super.key});

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
              builder: (_) => const TransverseReiforcementPage(),
            ),
          );
        },
        child: const Icon(Icons.arrow_forward, color: Colors.white),
      ),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 28),
                  child: Text(
                    'Esforços Solicitantes Maximos',
                    style: context.textStyles.textBold.copyWith(fontSize: 16),
                  ),
                ),
                TextResultTile(
                  title: 'Vsk max',
                  value: 50.5.toString(),
                  unitType: 'KN',
                ),
                TextResultTile(
                  title: 'Vsd',
                  value: 75.5.toString(),
                  unitType: 'KN',
                ),
                const SizedBox(
                  height: 32,
                ),
                const Text(
                    '* De acordo com a NBR618/2003 o esforço solicitante de calculo é 40% maior que o esforço solicitante caracteristico.'),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  child: Divider(),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    'Verificação da biela de concreto comprimido',
                    style: context.textStyles.textBold.copyWith(fontSize: 16),
                  ),
                ),
                TextResultTile(
                  title: 'Vrd2',
                  value: 175.5.toString(),
                  unitType: 'KN',
                ),
                const ResultTile(
                  textApproved: 'Vsd <= Vdr2',
                  textDenied: 'Vsd > Vdr2',
                  standardPhrase:
                      'De acordo com o item 12.5.2 da norma NBR 6118/2023 as condições analiticas de segurança estabelecem que as resistências não podem ser menores que as solicitações e devem ser verificadas em relação a todos os estados-limites e todos os caregamentos especificados para o tipo de construção considerado, portanto devem ser reavaliados os parâmetros das etapas anteriores.',
                  approved: true,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
