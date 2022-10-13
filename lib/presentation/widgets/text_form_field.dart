import 'package:flutter/material.dart';

class DefTextFormField extends StatelessWidget {
  final String hint;
  final String label;
  final TextEditingController textEditingController;
  final String? Function(String?)? validator;
  final FocusNode focusNode;
  final void Function()? onEditingComplete;
  final TextInputAction? textInputAction;

  const DefTextFormField(
      this.hint, this.label, this.textEditingController, this.validator,
      {super.key,
      required this.focusNode,
      this.onEditingComplete,
      this.textInputAction});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: textInputAction,
      onEditingComplete: onEditingComplete,
      focusNode: focusNode,
      validator: validator,
      controller: textEditingController,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
      ),
    );
  }
}
