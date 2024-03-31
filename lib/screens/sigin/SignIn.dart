import 'package:flutter/material.dart';
import 'package:ecommerce/responsive/ResponsiveWidget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ecommerce/screens/sigin/SignInWidgets.dart';
import '../../constant/AppColors.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _addressController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final TextEditingController _repeatPasswordController = TextEditingController();

     var list = [_nameController, _emailController , _addressController,_passwordController,_repeatPasswordController];


    final SignInWidgets signInWidgets = SignInWidgets();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: height,
        width: width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ResponsiveWidget.isSmallScreen(context)
                ? const SizedBox()
                : Expanded(
                    child: Container(
                        color: Colors.blue,
                        child: signInWidgets.buildCircleImage(context)),
                  ),
            Expanded(
              flex: 2,
              child: Container(
                height: height,
                color: AppColors.backColor,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: height * 0.025),
                      signInWidgets.buildTitle(context),
                      SizedBox(height: height * 0.02),
                      signInWidgets.buildField(
                          context,
                          AppLocalizations.of(context)!.putName,
                          Icons.abc,
                          false,
                          _nameController),
                      signInWidgets.buildField(
                          context,
                          AppLocalizations.of(context)!.enterEmail,
                          Icons.email,
                          false,
                          _emailController),
                      signInWidgets.buildField(
                          context,
                          AppLocalizations.of(context)!.putAddress,
                          Icons.house,
                          false,
                          _addressController),
                      signInWidgets.buildField(
                          context,
                          AppLocalizations.of(context)!.enterPassword,
                          Icons.password,
                          false,
                          _passwordController),
                      signInWidgets.buildField(
                          context,
                          AppLocalizations.of(context)!.repeatPassword,
                          Icons.repeat,
                          false,
                          _repeatPasswordController),
                      signInWidgets.buildForgotPasswordButton(context),
                      SizedBox(height: height * 0.05),
                      signInWidgets.buildSignInButton(context,list),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
