import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ecommerce/constant/AppColors.dart';
import 'package:ecommerce/responsive/ResponsiveWidget.dart';
import 'package:ecommerce/screens/sigin/SignInWidgets.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery
        .of(context)
        .size
        .height;
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _addressController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final TextEditingController _repeatPasswordController =
    TextEditingController();

    var list = [
      _nameController,
      _emailController,
      _addressController,
      _passwordController,
      _repeatPasswordController
    ];

    final SignInWidgets signInWidgets = SignInWidgets();

    return Scaffold(
      backgroundColor: Colors.white,
      body: ResponsiveWidget(
        largeScreen: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                color: AppColors.MIDNIGHTGREEN,
                child: signInWidgets.buildCircleImage(context),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                color: AppColors.WHITE,
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: _buildSignInForm(context, height, list, signInWidgets),
              ),
            ),
          ],
        ),
        mediumScreen: _buildSignInForm(context, height, list, signInWidgets),
        smallScreen: _buildSignInForm(context, height, list, signInWidgets),
      ),
    );
  }

  Widget _buildSignInForm(BuildContext context, double height,
      List<TextEditingController> list, SignInWidgets signInWidgets) {
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _addressController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final TextEditingController _repeatPasswordController =
    TextEditingController();
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 10, left: 10),
        child: SizedBox(
          height: height,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.05),
                signInWidgets.buildTitle(context),
                SizedBox(height: height * 0.04),
                signInWidgets.buildField(
                    context,
                    AppLocalizations.of(context)!.putName,
                    Icons.abc,
                    false,
                    _nameController),
                SizedBox(height: height * 0.02),
                signInWidgets.buildField(
                    context,
                    AppLocalizations.of(context)!.enterEmail,
                    Icons.email,
                    false,
                    _emailController),
                SizedBox(height: height * 0.02),
                signInWidgets.buildField(
                    context,
                    AppLocalizations.of(context)!.putAddress,
                    Icons.house,
                    false,
                    _addressController),
                SizedBox(height: height * 0.02),
                signInWidgets.buildField(
                    context,
                    AppLocalizations.of(context)!.enterPassword,
                    Icons.password,
                    false,
                    _passwordController),
                SizedBox(height: height * 0.02),
                signInWidgets.buildField(
                    context,
                    AppLocalizations.of(context)!.repeatPassword,
                    Icons.repeat,
                    false,
                    _repeatPasswordController),
                SizedBox(height: height * 0.04),
                signInWidgets.buildForgotPasswordButton(context),
                SizedBox(height: height * 0.04),
                signInWidgets.buildSignInButton(context, list),
              ],
            ),
          ),
        ),
      ),
    );
  }
}