import 'package:ecommerce/apicalls/auth/ProvidersAuth.dart';
import 'package:ecommerce/constant/AppColors.dart';
import 'package:ecommerce/widgets/shared/CustomButton.dart';
import 'package:ecommerce/widgets/shared/CustomTextForm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../widgets/shared/CustomTitle.dart';

class ResetPasswordForm extends StatelessWidget {
  ResetPasswordForm({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        width: 500,
        height: 300,
        decoration: BoxDecoration(
          color: AppColors.MIDNIGHTGREEN,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: AppColors.WHITE,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomTitle(
                  text: AppLocalizations.of(context)!.forgotPassword,
                ),
                CustomTextForm(
                  text: '',
                  iconData: Icons.email,
                  obscureText: false,
                  controller: _emailController,
                  label: AppLocalizations.of(context)!.putEmail,
                  tooltipText: '',
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: AppColors.PERSIMON,
                    textStyle: const TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    // Obtener el texto del campo de texto
                    String email = _emailController.text;
                    // Llamar a la función para enviar el correo electrónico de restablecimiento de contraseña
                    Auth.sendPasswordResetEmail(email);
                  },
                  child: const Text("Enviar correo"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


}
