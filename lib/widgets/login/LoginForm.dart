import 'package:ecommerce/constant/AppColors.dart';
import 'package:ecommerce/widgets/login/IconRow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../shared/CustomButton.dart';
import '../shared/CustomTextForm.dart';
import '../shared/CustomTitle.dart';
import 'ForgotPasswordButton.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required this.context,
    required this.height,
    required this.list,
  });

  final BuildContext context;
  final double height;
  final List<TextEditingController> list;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            SizedBox(height: height * 0.10),
            CustomTitle(),
            SizedBox(height: height * 0.050),
            Center(
              child: SizedBox(
                width: 200,
                child: CustomTextForm(
                  text: AppLocalizations.of(context)!.enterEmail,
                  iconData: Icons.email,
                  obscureText: false,
                  controller: list[0],
                ),
              ),
            ),
            SizedBox(height: height * 0.015),

            Center(
              child: SizedBox(
                width: 200,
                child: CustomTextForm(
                  text: AppLocalizations.of(context)!.enterPassword,
                  iconData: Icons.password,
                  obscureText: true,
                  controller: list[1],
                ),
              ),
            ),

            SizedBox(height: height * 0.03),
            IconRow(height:height),
            //SizedBox(height: height * 0.025),
            ForgotPasswordButton(),
            SizedBox(height: height * 0.03),

            //SizedBox(height: height * 0.050),
            CustomButton(listTextEditingController: list,text: 'Iniciar Sesion',),
          ],
        ),
      ],
    );
  }
}
