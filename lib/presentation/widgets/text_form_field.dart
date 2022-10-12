import 'package:flutter/material.dart';

class DefTextFormField extends StatelessWidget {
  final String hint;
  final String label;
  final TextEditingController textEditingController;
  final String? Function(String?)? validator;

  const DefTextFormField(
      this.hint, this.label, this.textEditingController, this.validator,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: textEditingController,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
      ),
    );
  }
}
