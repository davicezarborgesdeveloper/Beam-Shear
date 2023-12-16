import 'package:beamshear/app/core/common/input_field.dart';
import 'package:flutter/material.dart';

import '../../../core/ui/helpers/constants.dart';
import '../../../core/ui/helpers/enums.dart';

class DistributedTile extends StatelessWidget {
  final List<TextEditingController> controllers;
  final LoadType? type;
  const DistributedTile({
    this.type,
    required this.controllers,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 8,
        ),
        Image.asset('assets/images/distributed.png'),
        InputField(
          controller: controllers[0],
          label: 'q',
          suffix: const Text(Units.knm),
          validator: (value) {
            if (type == LoadType.distributed) {
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
          controller: controllers[1],
          label: 'L',
          suffix: const Text(Units.meters),
          validator: (value) {
            if (type == LoadType.distributed) {
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
