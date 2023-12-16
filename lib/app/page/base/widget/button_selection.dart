import 'package:beamshear/app/page/base/widget/button_tile.dart';
import 'package:beamshear/app/page/under_construction/under_construction_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../controller/drawer_controller.dart';

class ButtonSelection extends StatelessWidget {
  const ButtonSelection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ButtonTile(
          image: 'assets/images/T.png',
          title: 'T',
          onTap: () {
            GetIt.I<CustomDrawerController>().value.jumpToPage(1);
          },
        ),
        const SizedBox(
          height: 48,
        ),
        ButtonTile(
          image: 'assets/images/square.png',
          title: 'Retangular',
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => const UnderConstructionPage()));
          },
        ),
      ],
    );
  }
}
