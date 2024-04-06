import 'package:ecommerce/apicalls/ApiUser.dart';
import 'package:ecommerce/constant/baseurls.dart';
import 'package:ecommerce/screens/sigin/ControllerSignIn.dart';
import 'package:ecommerce/shared/CustomDialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:getwidget/getwidget.dart';
import '../../constant/AppColors.dart';

class SignInWidgets {
  Widget buildTitle(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        AppLocalizations.of(context)!.createAccount,
        style: const TextStyle(
          fontSize: 28,
          fontFamily: 'Sans Serif',
        ),
      ),
    );
  }

  Widget buildField(BuildContext context, String text, IconData iconData,
      bool obscureText, TextEditingController controller) {
    final double width = MediaQuery.of(context).size.width;

    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        border: InputBorder.none,
        prefixIcon: Icon(
          iconData,
          color: AppColors.PERSIMON,
        ),
        contentPadding: const EdgeInsets.only(top: 12.0),
        hintText: text,
      ),
      onChanged: (value) {},
    );
  }

  Widget buildForgotPasswordButton(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: TextButton(
        onPressed: () {},
        child: Text(
          AppLocalizations.of(context)!.forgotPassword,
          style: TextStyle(color: AppColors.PERSIMON),
        ),
      ),
    );
  }

  Widget buildSignInButton(BuildContext context,
      List<TextEditingController> listTextEditingController) {
    ControllerSignIn controllerSignIn = ControllerSignIn();

    return Material(
      child: InkWell(
        onTap: () async {
          bool areValuesValid =
              controllerSignIn.validateValues(listTextEditingController);
          if (!areValuesValid) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return const dialogo(
                  textoSuperior: " Rellene todos los campos",
                  textInferior: "",
                );
              },
            );
          } else {
            ApiUser apiUser = ApiUser();
            bool saved =
                await apiUser.saveUser(listTextEditingController, context);

            if (saved) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const dialogo(
                    textoSuperior: "",
                    textInferior: "dentro",
                  );
                },
              );
            } else {
              for (var controller in listTextEditingController) {
                controller.clear();
              }
            }
          }
        },
        borderRadius: BorderRadius.circular(16.0),
        child: Ink(
          padding: const EdgeInsets.symmetric(horizontal: 70.0, vertical: 18.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: AppColors.MIDNIGHTGREEN,
              border: Border.all(color: Colors.transparent)),
          child: Text(
            AppLocalizations.of(context)!.enter,
            style: TextStyle(color: AppColors.WHITE),
          ),
        ),
      ),
    );
  }

  Widget buildCircleImage(BuildContext context) {
    return const Center(
        child: GFImageOverlay(
      height: 250,
      width: 250,
      shape: BoxShape.circle,
      image: NetworkImage('${BaseUrls.IMGURLS}corporativa/logoBackground.png'),
      boxFit: BoxFit.cover,
    ));
  }
}
