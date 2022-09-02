import 'package:flutter/material.dart';

class FormInput extends StatelessWidget {
  const FormInput({
    required this.labelText,
    this.controller,
    this.onChanged,
    this.validator,
    Key? key,
  }) : super(key: key);
  final String labelText;
  final TextEditingController? controller;
  final Function(String? value)? onChanged;
  final String? Function(String? value)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: labelText,
        labelStyle: const TextStyle(
          color: Colors.black87,
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 2.0,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 2.0,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
            width: 0.0,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.green,
            width: 2.0,
          ),
        ),
        fillColor: Colors.white,
        filled: true,
      ),
      onChanged: onChanged,
      validator: validator,
    );
  }
}
