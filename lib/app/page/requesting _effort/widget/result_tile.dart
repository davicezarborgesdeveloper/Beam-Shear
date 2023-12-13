import 'package:beamshear/app/core/styles/colors_app.dart';
import 'package:beamshear/app/core/styles/text_styles.dart';
import 'package:flutter/material.dart';

class ResultTile extends StatelessWidget {
  final String textApproved;
  final String textDenied;
  final String? standardPhrase;
  final String? approvedPhrase;
  final bool approved;
  const ResultTile(
      {required this.textApproved,
      required this.textDenied,
      this.standardPhrase,
      this.approvedPhrase,
      required this.approved,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(
                  color: approved ? ColorsApp.i.primary : Colors.grey.shade600,
                ),
              ),
              child: Text(
                approved ? textApproved : textDenied,
                style: context.textStyles.textMedium.copyWith(
                    fontSize: 20,
                    color:
                        approved ? ColorsApp.i.primary : Colors.grey.shade600),
              ),
            ),
            Text(
              approved ? 'APROVADO' : 'NEGADO',
              style: context.textStyles.textMedium.copyWith(
                  fontSize: 24,
                  color: approved ? ColorsApp.i.primary : Colors.grey.shade600),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(approved ? approvedPhrase ?? '' : standardPhrase ?? '',
                style: context.textStyles.textRegular.copyWith(
                    fontSize: 12,
                    color:
                        approved ? ColorsApp.i.primary : Colors.grey.shade600))
          ],
        ),
      ),
    );
  }
}
