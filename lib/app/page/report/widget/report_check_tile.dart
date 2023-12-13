import 'package:beamshear/app/core/styles/text_styles.dart';
import 'package:flutter/material.dart';

class ReportCheckTile extends StatelessWidget {
  final String text;
  const ReportCheckTile({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                text,
                style: context.textStyles.textRegular.copyWith(fontSize: 16),
              ),
              const SizedBox(
                width: 8,
              ),
              const Icon(
                Icons.check,
                color: Colors.green,
                size: 32,
              )
            ],
          ),
          const Divider(
            height: 16,
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
