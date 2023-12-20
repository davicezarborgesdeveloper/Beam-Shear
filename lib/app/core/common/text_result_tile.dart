import 'package:beamshear/app/core/styles/text_styles.dart';
import 'package:flutter/material.dart';

import '../styles/colors_app.dart';

class TextResultTile extends StatelessWidget {
  final String title;
  final double value;
  final int? decimal;
  final String unitType;
  const TextResultTile({
    required this.title,
    required this.value,
    this.decimal,
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
          style: context.textStyles.textBold.copyWith(fontSize: 16),
        ),
        RichText(
          text: TextSpan(
              text: decimal != null
                  ? '${value.toStringAsFixed(decimal!)} '
                  : '$value ',
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
