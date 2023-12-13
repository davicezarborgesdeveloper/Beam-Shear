// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:beamshear/app/core/styles/colors_app.dart';
import 'package:beamshear/app/core/styles/text_styles.dart';
import 'package:flutter/material.dart';

class ReportTile extends StatelessWidget {
  final String text;
  final double value;
  final String unit;
  const ReportTile(
      {required this.text, required this.value, required this.unit, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Text(
            '$text:',
            style: context.textStyles.textRegular.copyWith(fontSize: 16),
          ),
          const SizedBox(width: 8),
          Text(
            '$value',
            style: context.textStyles.textRegular
                .copyWith(fontSize: 16, color: ColorsApp.i.primary),
          ),
          const SizedBox(width: 2),
          Text(
            unit,
            style: context.textStyles.textRegular,
          ),
        ],
      ),
    );
  }
}
