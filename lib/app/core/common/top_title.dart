import 'package:beamshear/app/core/styles/colors_app.dart';
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
                  CircleAvatar(
                    backgroundColor: ColorsApp.i.primaryLight,
                    child: Text(
                      type!,
                      style: const TextStyle(color: Colors.white),
                    ),
                  )
                ],
              )
          ],
        ),
      ),
    );
  }
}
