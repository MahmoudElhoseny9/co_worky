import 'package:flutter/material.dart';

class CustomAuthTextField extends StatelessWidget {
  const CustomAuthTextField({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter your email';
        } else {
          return null;
        }
      },
      keyboardType: TextInputType.emailAddress,
      autofillHints: const [AutofillHints.email],
      decoration: InputDecoration(
        filled: true,
        fillColor: Theme.of(context).colorScheme.onPrimary,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
        labelText: 'Email',
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 2,
            color: Colors.black12.withOpacity(0.5),
          ),
          borderRadius: BorderRadius.circular(40),
        ),
      ),
    );
  }
}
