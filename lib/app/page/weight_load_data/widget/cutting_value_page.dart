import 'package:beamshear/app/core/ui/helpers/constants.dart';
import 'package:beamshear/app/core/ui/helpers/enums.dart';
import 'package:flutter/material.dart';

import '../../../core/common/input_field.dart';

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
          label: 'v',
          suffix: const Text(Units.knewton),
          controller: controller,
          validator: (value) {
            if (type == LoadType.cortante) {
              if (value.isEmpty) {
                return 'o campo é obrigatório';
              } else if (double.parse(value) <= 0) {
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