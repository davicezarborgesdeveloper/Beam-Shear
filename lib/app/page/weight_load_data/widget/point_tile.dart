import 'package:flutter/material.dart';

import '../../../common/input_field.dart';

class PointTile extends StatelessWidget {
  const PointTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 8,
        ),
        Image.asset('assets/images/point.png'),
        const InputField(
          label: 'q',
          suffix: Text('KN'),
        ),
        const InputField(
          label: 'x',
          suffix: Text('m'),
        ),
        const InputField(
          label: 'L',
          suffix: Text('m'),
        ),
      ],
    );
  }
}
