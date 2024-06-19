import 'package:co_worky/presentation/widgets/auth_widgets/custom_auth_text_field.dart';
import 'package:co_worky/presentation/widgets/auth_widgets/social_buttons.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
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
                child: Text(
                    'Fill out the information below in order to access your account.')),
            const SizedBox(
              height: 20,
            ),
            const CustomAuthTextField(),
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
              height: 20,
            ),
            FilledButton(
              onPressed: () {
                Navigator.of(context).pushNamed("/userPage");
              },
              style: FilledButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                padding:
                    const EdgeInsets.symmetric(horizontal: 100, vertical: 12),
                textStyle: Theme.of(context).textTheme.titleMedium,
                elevation: 3,
              ),
              child: const Text('Log In'),
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
            TextButton(
              onPressed: () {},
              child: Text(
                'Forgot Password?',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
