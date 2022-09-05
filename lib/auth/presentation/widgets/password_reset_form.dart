import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/presentation/theming/custom_colors.dart';
import '../../../core/presentation/validators/form_validators.dart';
import '../../shared/providers.dart';
import 'email_icon_button.dart';
import 'form_text_input.dart';

class PasswordResetForm extends ConsumerStatefulWidget {
  const PasswordResetForm({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PasswordResetFormState createState() => _PasswordResetFormState();
}

class _PasswordResetFormState extends ConsumerState<PasswordResetForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          FormTextInput(
            controller: _emailController,
            validator: FormValidators.emailValidator(),
            hintText: 'Enter your account email',
            textAlign: TextAlign.center,
            border: const UnderlineInputBorder(),
            errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: CustomColors.mediumRed,
                width: 2,
              ),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: CustomColors.mediumYellow,
                width: 2,
              ),
            ),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: CustomColors.lightBlue,
                width: 2,
              ),
            ),
          ),
          const SizedBox(height: 20),
          EmailIconButton(
            text: 'Send Reset Email',
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                ref
                    .read(passwordResetNotifierProvider.notifier)
                    .sendPasswordResetEmail(_emailController.text);
              }
            },
          ),
        ],
      ),
    );
  }
}
