import 'package:ecommerce/apicalls/ApiUser.dart';
import 'package:ecommerce/constant/baseurls.dart';
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
          fontSize: 24,
        ),
      ),
    );
  }

  Widget buildField(BuildContext context, String text, IconData iconData,
      bool obscureText, TextEditingController controller) {
    final double width = MediaQuery.of(context).size.width;

    return Center(
      child: Container(
        height: 50.0,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: AppColors.whiteColor,
        ),
        child: TextFormField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(iconData),
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
        child: Text(AppLocalizations.of(context)!.forgotPassword),
      ),
    );
  }

  Widget buildSignInButton(BuildContext context,
      List<TextEditingController> listTextEditingController) {
    return Center(
      child: Material(
        child: InkWell(
          onTap: () {

            ApiUser apiUser = ApiUser();
            apiUser.saveUser(listTextEditingController);
          },
          borderRadius: BorderRadius.circular(16.0),
          child: Ink(
            padding:
                const EdgeInsets.symmetric(horizontal: 70.0, vertical: 18.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: AppColors.mainBlueColor,
            ),
            child: Text(AppLocalizations.of(context)!.enter),
          ),
        ),
      ),
    );
  }

  Widget buildCircleImage(BuildContext context) {
    return const Center(
        child: GFImageOverlay(
      height: 200,
      width: 200,
      shape: BoxShape.circle,
      image: NetworkImage(
          '${BaseUrls.IMGURLS}productos/teclado/1132-razer-blackwidow-v3-tenkeyless-teclado-gaming-retroiluminado-yellow-switch.webp'),
      boxFit: BoxFit.cover,
    ));
  }
}
