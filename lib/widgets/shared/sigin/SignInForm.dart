import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../CustomButton.dart';
import '../CustomTextForm.dart';
import '../CustomTitle.dart';

class SignInForm extends StatelessWidget {
  final double height;
  final List<TextEditingController> list;

  const SignInForm({
    Key? key,
    required this.height,
    required this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: height * 0.25),
        CustomTitle(),
        SizedBox(height: height * 0.015),
        Column(
          children: [
            SizedBox(height: height * 0.015),
            Center(
              child: SizedBox(
                width: 250,
                child: CustomTextForm(
                  text: AppLocalizations.of(context)!.putName,
                  iconData: Icons.abc,
                  obscureText: false,
                  controller: list[0],
                ),
              ),
            ),
            SizedBox(height: height * 0.015),
            Center(
              child: SizedBox(
                width: 250,
                child: CustomTextForm(
                  text: AppLocalizations.of(context)!.enterEmail,
                  iconData: Icons.email,
                  obscureText: false,
                  controller: list[1],
                ),
              ),
            ),
            SizedBox(height: height * 0.015),
            Center(
              child: SizedBox(
                width: 250,
                child: CustomTextForm(
                  text: AppLocalizations.of(context)!.putAddress,
                  iconData: Icons.house,
                  obscureText: false,
                  controller: list[2],
                ),
              ),
            ),
            SizedBox(height: height * 0.015),
            Center(
              child: SizedBox(
                width: 250,
                child: CustomTextForm(
                  text: AppLocalizations.of(context)!.enterPassword,
                  iconData: Icons.password,
                  obscureText: false,
                  controller: list[3],
                ),
              ),
            ),
            SizedBox(height: height * 0.015),
            Center(
              child: SizedBox(
                width: 250,
                child: CustomTextForm(
                  text: AppLocalizations.of(context)!.repeatPassword,
                  iconData: Icons.repeat,
                  obscureText: false,
                  controller: list[4],
                ),
              ),
            ),
            SizedBox(height: height * 0.04),
            CustomButton(listTextEditingController: list),
          ],
        ),
      ],
    );
  }
}
