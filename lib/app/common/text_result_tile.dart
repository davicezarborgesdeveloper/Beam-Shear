import 'package:beamshear/app/core/styles/text_styles.dart';
import 'package:flutter/material.dart';

import '../core/styles/colors_app.dart';

class TextResultTile extends StatelessWidget {
  final String title;
  final String value;
  final String unitType;
  const TextResultTile({
    required this.title,
    required this.value,
    required this.unitType,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          '$title:',
          style: context.textStyles.textSemiBold.copyWith(fontSize: 16),
        ),
        RichText(
          text: TextSpan(
              text: '$value ',
              style: context.textStyles.textRegular
                  .copyWith(fontSize: 20, color: ColorsApp.i.primary),
              children: [
                TextSpan(
                  text: unitType,
                  style: context.textStyles.textRegular
                      .copyWith(fontSize: 16, color: Colors.black),
                ),
              ]),
        ),
      ],
    );
  }
}
