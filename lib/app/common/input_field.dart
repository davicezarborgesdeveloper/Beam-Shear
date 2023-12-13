import 'package:beamshear/app/core/styles/colors_app.dart';
import 'package:beamshear/app/core/styles/text_styles.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String? label;
  final String? errorText;
  final Widget? suffix;

  final TextEditingController? controller;

  const InputField(
      {this.label, this.errorText, this.controller, this.suffix, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(
          label: Text(
            label!,
            style: context.textStyles.textRegular
                .copyWith(color: ColorsApp.i.primary),
          ),
          suffix: suffix,
        ),
      ),
    );
  }
}
