import 'package:firebase_auth_with_riverpod_tutorial/auth/presentation/widgets/email_icon_button.dart';
import 'package:firebase_auth_with_riverpod_tutorial/auth/presentation/widgets/form_text_input.dart';
import 'package:firebase_auth_with_riverpod_tutorial/auth/shared/providers.dart';
import 'package:firebase_auth_with_riverpod_tutorial/core/presentation/validators/form_validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInForm extends ConsumerStatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends ConsumerState<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          FormTextInput(
            label: 'Email',
            icon: Icons.email_rounded,
            validator: FormValidators.emailValidator(),
            controller: _emailController,
          ),
          FormTextInput(
            label: 'Password',
            icon: Icons.lock_outline_rounded,
            validator: FormValidators.passwordValidator(),
            secure: true,
            controller: _passwordController,
          ),
          EmailIconButton(
            text: 'Sign in with Email',
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                ref
                    .watch(authNotifierProvider.notifier)
                    .signInWithEmailAndPassword(
                        _emailController.text, _passwordController.text);
              }
            },
          ),
        ],
      ),
    );
  }
}
