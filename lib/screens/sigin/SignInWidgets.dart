import 'package:ecommerce/apicalls/ApiUser.dart';
import 'package:ecommerce/constant/baseurls.dart';
import 'package:ecommerce/shared/CustomAlert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:getwidget/getwidget.dart';
import '../../constant/AppColors.dart';

class SignInWidgets {
  Widget buildTitle(BuildContext context) {
    return Center(
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

    return Center(
      child: Container(
        height: 55.0,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: AppColors.WHITE,
          // border: Border.all(color: AppColors.PERSIMON)
        ),
        child: TextFormField(
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
        ),
      ),
    );
  }

  Widget buildForgotPasswordButton(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: TextButton(
        onPressed: () {},
        child: Text(AppLocalizations.of(context)!.forgotPassword,
        style: TextStyle(
          color: AppColors.PERSIMON
        ),
        ),
      ),
    );
  }

  Widget buildSignInButton(BuildContext context,
      List<TextEditingController> listTextEditingController) {
    CustomAlert customAlert = CustomAlert();
    return Center(
      child: Material(
        child: InkWell(
          onTap: () async {
            ApiUser apiUser = ApiUser();
            bool saved = await apiUser.saveUser(listTextEditingController);
            if (saved) {
              // Los datos se guardaron con éxito, ahora puedes limpiar los controladores
              for (var controller in listTextEditingController) {
                controller.clear();
              }
            } else {
              // Hubo un error al guardar los datos, puedes mostrar un mensaje de error si lo deseas
            }
          },
          borderRadius: BorderRadius.circular(16.0),
          child: Ink(
            padding:
                const EdgeInsets.symmetric(horizontal: 70.0, vertical: 18.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: AppColors.MIDNIGHTGREEN,
                border: Border.all()),
            child: Text(
              AppLocalizations.of(context)!.enter,
              style: TextStyle(color: AppColors.WHITE),
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
