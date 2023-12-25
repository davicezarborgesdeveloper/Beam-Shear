// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:beamshear/app/core/ui/helpers/formatters.dart';
import 'package:flutter/material.dart';

import 'package:beamshear/app/core/styles/colors_app.dart';
import 'package:beamshear/app/core/styles/text_styles.dart';
import 'package:flutter/services.dart';

class InputField extends StatefulWidget {
  final String? label;
  final Widget? suffix;
  final TextEditingController? controller;
  final FormFieldValidator? validator;
  final bool? editable;
  final ValueChanged<String>? onChanged;
  const InputField({
    this.label,
    this.suffix,
    this.controller,
    this.validator,
    this.editable = true,
    this.onChanged,
    super.key,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        enabled: widget.editable,
        controller: widget.controller,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(
          label: Text(
            widget.label!,
            style: context.textStyles.textRegular
                .copyWith(color: ColorsApp.i.primary),
          ),
          suffix: widget.suffix,
        ),
        validator: widget.validator,
        onChanged: widget.onChanged,
        inputFormatters: [
          CommaFormatter(),
          FilteringTextInputFormatter.allow(
            RegExp(r'^[0-9]+[,]?[0-9]*'),
          ),
        ],
      ),
    );
  }
}
