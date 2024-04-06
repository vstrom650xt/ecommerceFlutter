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
    return Text(
      AppLocalizations.of(context)!.createAccount,
      style: const TextStyle(
        fontSize: 28,
        fontFamily: 'Sans Serif',
        color: AppColors.MIDNIGHTGREEN
      ),
    );
  }

  Widget buildField(BuildContext context, String text, IconData iconData,
      bool obscureText, TextEditingController controller) {

    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        border: InputBorder.none,
        prefixIcon: Icon(
          iconData,
          color: AppColors.PERSIMON,
        ),
        hintText: text,
      ),
      onChanged: (value) {},
    );
  }

  Widget buildForgotPasswordButton(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        AppLocalizations.of(context)!.forgotPassword,
        style: const TextStyle(color: AppColors.PERSIMON),
      ),
    );
  }

  Widget buildSignInButton(BuildContext context,
      List<TextEditingController> listTextEditingController) {
    ControllerSignIn controllerSignIn = ControllerSignIn();

    return Container(
      width: 200.0,
      height: 50.0,
      decoration: BoxDecoration(
        color: AppColors.MIDNIGHTGREEN,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: InkWell(
        onTap: () async {
       controllerSignIn.sigIn(context, listTextEditingController);
        },
        child: const Center(
          child: Text(
            'Iniciar sesión', // Texto del botón
            style: TextStyle(
              color: Colors.white, // Color del texto
              fontSize: 16.0, // Tamaño del texto
            ),
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
