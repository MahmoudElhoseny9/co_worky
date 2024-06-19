import 'package:flutter/material.dart';

class UserTextField extends StatelessWidget {
  const UserTextField({
    super.key,
    required this.icon,
    required this.initialValue, required this.keyboardType,
  });

  final IconData icon;
  final String initialValue;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      initialValue: initialValue,
      decoration: InputDecoration(
          prefixIconColor: Colors.blueGrey,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(45),
          ),
          prefixIcon: Icon(icon)),
    );
  }
}
