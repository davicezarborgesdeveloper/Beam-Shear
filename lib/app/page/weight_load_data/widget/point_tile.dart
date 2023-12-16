import 'package:flutter/material.dart';

import '../../../core/common/input_field.dart';
import '../../../core/ui/helpers/constants.dart';
import '../../../core/ui/helpers/enums.dart';

class PointTile extends StatelessWidget {
  final List<TextEditingController> controllers;
  final LoadType? type;
  const PointTile({this.type, required this.controllers, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 8,
        ),
        Image.asset('assets/images/point.png'),
        InputField(
          label: 'q',
          suffix: const Text(Units.knewton),
          controller: controllers[0],
          validator: (value) {
            if (type == LoadType.point) {
              if (value.isEmpty) {
                return 'o campo é obrigatório';
              } else if (double.parse(value) <= 0) {
                return 'o valor deve ser positivo';
              }
            }
            return null;
          },
        ),
        InputField(
          label: 'x',
          suffix: const Text(Units.meters),
          controller: controllers[1],
          validator: (value) {
            if (type == LoadType.point) {
              if (value.isEmpty) {
                return 'o campo é obrigatório';
              } else if (double.parse(value) <= 0) {
                return 'o valor deve ser positivo';
              }
            }
            return null;
          },
        ),
        InputField(
          label: 'L',
          suffix: const Text(Units.meters),
          controller: controllers[2],
          validator: (value) {
            if (type == LoadType.point) {
              if (value.isEmpty) {
                return 'o campo é obrigatório';
              } else if (double.parse(value) <= 0) {
                return 'o valor deve ser positivo';
              }
            }
            return null;
          },
        ),
        const SizedBox(
          height: 32,
        ),
      ],
    );
  }
}
