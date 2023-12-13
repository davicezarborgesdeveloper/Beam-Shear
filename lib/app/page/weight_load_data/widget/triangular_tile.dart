import 'package:beamshear/app/common/input_field.dart';
import 'package:flutter/material.dart';

class TriangularTile extends StatelessWidget {
  const TriangularTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 8,
        ),
        Image.asset('assets/images/triangular.png'),
        const InputField(
          label: 'q',
          suffix: Text('KN/m'),
        ),
        const InputField(
          label: 'L',
          suffix: Text('m'),
        ),
      ],
    );
  }
}
