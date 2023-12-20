import 'package:beamshear/app/core/styles/colors_app.dart';
import 'package:beamshear/app/core/styles/text_styles.dart';
import 'package:flutter/material.dart';

class ResultTile extends StatelessWidget {
  final String textApproved;
  final String textDenied;
  final String? standardPhrase;
  final String? approvedPhrase;
  final String? text;
  final bool approved;
  const ResultTile(
      {required this.textApproved,
      required this.textDenied,
      this.standardPhrase,
      this.approvedPhrase,
      this.text,
      required this.approved,
      super.key});

  @override
  Widget build(BuildContext context) {
    String phrase = approved ? approvedPhrase ?? '' : standardPhrase ?? '';
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
            if (text != null && text!.isEmpty)
              Container()
            else
              Text(
                text == null ? (approved ? 'APROVADO' : 'NEGADO') : text!,
                style: context.textStyles.textMedium.copyWith(
                    fontSize: 24,
                    color:
                        approved ? ColorsApp.i.primary : Colors.grey.shade600),
              ),
            if (phrase.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Text(
                    approved ? approvedPhrase ?? '' : standardPhrase ?? '',
                    style: context.textStyles.textRegular.copyWith(
                        fontSize: 12,
                        color: approved
                            ? ColorsApp.i.primary
                            : Colors.grey.shade600)),
              )
          ],
        ),
      ),
    );
  }
}
