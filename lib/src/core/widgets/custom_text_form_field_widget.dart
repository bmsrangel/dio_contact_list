import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.labelText,
    this.keyboardType,
    this.validator,
    this.textInputAction,
    this.controller,
    this.textCapitalization,
  });

  final String? labelText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final TextCapitalization? textCapitalization;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextFormField(
        controller: controller,
        textCapitalization: textCapitalization ?? TextCapitalization.words,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: labelText,
        ),
        keyboardType: keyboardType,
        validator: validator,
        textInputAction: textInputAction,
      ),
    );
  }
}
