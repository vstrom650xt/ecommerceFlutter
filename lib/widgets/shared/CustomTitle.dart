import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../constant/AppColors.dart';

class CustomTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      AppLocalizations.of(context)!.createAccount,
      style: const TextStyle(
        fontSize: 28,
        fontFamily: 'Sans Serif',
        color: AppColors.MIDNIGHTGREEN,
      ),
    );
  }
}
