import 'package:beamshear/app/core/common/input_field.dart';
import 'package:beamshear/app/core/ui/helpers/enums.dart';
import 'package:flutter/material.dart';

import '../../../core/ui/helpers/constants.dart';
import '../../../core/ui/helpers/parses.dart';

class TriangularTile extends StatelessWidget {
  final List<TextEditingController> controllers;
  final LoadType? type;
  const TriangularTile({this.type, required this.controllers, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 8,
        ),
        Image.asset('assets/images/triangular.png'),
        InputField(
          label: 'q',
          suffix: const Text(Units.knm),
          controller: controllers[0],
          validator: (value) {
            if (type == LoadType.triangular) {
              if (value.isEmpty) {
                return 'o campo é obrigatório';
              } else if (doubleParse(value) <= 0) {
                return 'o valor deve ser positivo';
              }
            }
            return null;
          },
        ),
        InputField(
          label: 'L',
          suffix: const Text(Units.meters),
          controller: controllers[1],
          validator: (value) {
            if (type == LoadType.triangular) {
              if (value.isEmpty) {
                return 'o campo é obrigatório';
              } else if (doubleParse(value) <= 0) {
                return 'o valor deve ser positivo';
              }
            }
            return null;
          },
        ),
        const SizedBox(
          height: 64,
        ),
      ],
    );
  }
}
