import 'package:ecommerce/screens/resetpassword/ResetPassword.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../constant/AppColors.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ResetPassword()),
        );
      },
      child: Text(
        AppLocalizations.of(context)!.forgotPassword,
        style: TextStyle(color: AppColors.PERSIMON),
      ),
    );
  }
}
