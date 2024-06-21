import 'package:flutter/material.dart';

class EditProfileTextField extends StatelessWidget {
  final String labelText; // Label text for the field
  final String hintText; // Optional hint text (can be empty string "")
  final TextInputType keyboardType; // Optional keyboard type
  final String? Function(String?)? validator; // Optional validator function
  final TextEditingController? controller;
  const EditProfileTextField({
    super.key,
    required this.labelText,
    this.hintText = "",
    required this.keyboardType,
    this.validator,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(8, 4, 8, 4),
      child: TextFormField(
        controller: controller,
        validator: validator,
        autofocus: false,
        obscureText: false,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(
            fontFamily: 'Acronym',
            letterSpacing: 0,
          ),
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.error,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        style: const TextStyle(
          fontFamily: 'Acronym',
          letterSpacing: 0,
        ),
        keyboardType: keyboardType,
      ),
    );
  }
}
