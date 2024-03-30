import 'package:ecommerce/constant/baseurls.dart';
import 'package:ecommerce/screens/sigin/ControllerSignIn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:getwidget/getwidget.dart';
import '../../constant/AppColors.dart';

class SignInWidgets {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController = TextEditingController();


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

  Widget buildField(BuildContext context, String text, IconData iconData , bool obscureText) {
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
          obscureText: obscureText,
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(iconData),
            contentPadding: EdgeInsets.only(top: 12.0),
            hintText: text,
          ),
          onChanged: (value){

          },
        ),
      ),
    );
  }

  Widget buildForgotPasswordButton(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: TextButton(
        onPressed: () {
        },
        child: Text(AppLocalizations.of(context)!.forgotPassword),
      ),
    );
  }

  Widget buildSignInButton(BuildContext context) {
    ControllerSignIn controllerSignIn = ControllerSignIn();
    return Center(
      child: Material(
        child: InkWell(
          onTap: () {
            String password = _passwordController.text;
            String repeatPassword = _repeatPasswordController.text;
            bool passwordsMatch = controllerSignIn.arePasswordsEqual(password, repeatPassword);

            print(password);
            print(repeatPassword);

            if (passwordsMatch) {
              print('Son iguales de ejemplo' + password + repeatPassword);

            } else {
              print('No son iguales de ejemplo');
            }
          },

          borderRadius: BorderRadius.circular(16.0),
          child: Ink(
            padding: const EdgeInsets.symmetric(horizontal: 70.0, vertical: 18.0),
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


  Widget buildCircleImage(BuildContext context){
    return const Center(
        child: GFImageOverlay(
          height: 200,
          width: 200,
          shape: BoxShape.circle,
          image:NetworkImage(BaseUrls.IMGURLS + 'productos/teclado/1132-razer-blackwidow-v3-tenkeyless-teclado-gaming-retroiluminado-yellow-switch.webp'),
          boxFit: BoxFit.cover,
        )
    );


  }
}
