import 'package:beamshear/app/core/styles/colors_app.dart';
import 'package:beamshear/app/core/styles/text_styles.dart';
import 'package:flutter/material.dart';

class TopTitle extends StatelessWidget {
  final String? type;
  final String? title;
  final String? subtitle;
  const TopTitle({this.type, this.title, this.subtitle, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title ?? '',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              subtitle ?? '',
              style: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            if (type != null)
              Column(
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 16),
                    decoration: BoxDecoration(
                      color: ColorsApp.i.primaryLight,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Text(
                      type!,
                      style: context.textStyles.textRegular
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}
