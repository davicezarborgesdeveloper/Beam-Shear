import 'package:beamshear/app/core/ui/helpers/constants.dart';
import 'package:beamshear/app/core/ui/helpers/enums.dart';
import 'package:flutter/material.dart';

import '../../../core/common/input_field.dart';
import '../../../core/ui/helpers/parses.dart';

class CuttingValuePage extends StatelessWidget {
  final TextEditingController controller;
  final LoadType? type;
  const CuttingValuePage({this.type, required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 8,
        ),
        InputField(
          label: 'Vsk',
          suffix: const Text(Units.knewton),
          controller: controller,
          validator: (value) {
            if (type == LoadType.cortante) {
              if (value.isEmpty) {
                return 'o campo é obrigatório';
              } else if (doubleParse(value) <= 0) {
                return 'o valor deve ser positivo';
              }
            }
            return null;
          },
        ),
      ],
    );
  }
}
