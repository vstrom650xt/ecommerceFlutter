import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../widgets/shared/CustomButton.dart';
import '../../widgets/shared/CustomTextForm.dart';
import '../../widgets/shared/CustomTitle.dart';

class LoginWidgets {


  Widget buildLoginForm(BuildContext context,
      double height,
      List<TextEditingController> list,
     ) {
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
                  text: AppLocalizations.of(context)!.enterPassword,
                  iconData: Icons.password,
                  obscureText: false,
                  controller: list[3],
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