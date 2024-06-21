import 'package:co_worky/presentation/widgets/auth_widgets/social_buttons.dart';
import 'package:flutter/material.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 16,
      ),
      child: Form(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 4,
            ),
            const SizedBox(
                width: double.infinity,
                child:
                    Text('Let\'s get started by filling out the form below.')),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
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
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your password';
                } else {
                  return null;
                }
              },
              keyboardType: TextInputType.visiblePassword,
              autofillHints: const [AutofillHints.password],
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.visibility),
                ),
                filled: true,
                fillColor: Theme.of(context).colorScheme.onPrimary,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.black12.withOpacity(0.5),
                  ),
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              keyboardType: TextInputType.visiblePassword,
              autofillHints: const [AutofillHints.password],
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.visibility),
                ),
                filled: true,
                fillColor: Theme.of(context).colorScheme.onPrimary,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                labelText: 'Confirm Password',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.black12.withOpacity(0.5),
                  ),
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // her signup as user or co-work
            DropdownButtonFormField<String>(
              items: ["co-worker", "user"].map((String value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                // Handle the selected item
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Theme.of(context).colorScheme.onPrimary,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                labelText: 'Sign up as',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: Colors.black12.withOpacity(0.5),
                  ),
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            const Text(
              'Or sign up with',
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 24,
            ),
            const SocialButtons(),
          ],
        ),
      ),
    );
  }
}
