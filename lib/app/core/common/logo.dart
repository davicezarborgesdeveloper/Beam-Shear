import 'package:beamshear/app/core/styles/colors_app.dart';
import 'package:beamshear/app/core/styles/text_styles.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(bottom: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Fidelix',
              style: context.textStyles.textBlack.copyWith(color: Colors.black),
            ),
            Text(
              ' & ',
              style: context.textStyles.textBlack
                  .copyWith(color: ColorsApp.i.primaryLight, fontSize: 18),
            ),
            Text(
              'Cavalcante',
              style: context.textStyles.textBlack.copyWith(color: Colors.black),
            )
          ],
        ));
  }
}
