import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ecommerce/constant/AppColors.dart';
import 'package:ecommerce/responsive/ResponsiveWidget.dart';
import 'package:ecommerce/screens/sigin/SignInWidgets.dart';
import '../../constant/baseurls.dart';
import '../../shared/TabWidget.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
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
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.network(
                      '${BaseUrls.IMGURLS}corporativa/cascos.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    color: Colors.transparent, // Hacer el contenedor transparente para que la imagen de fondo sea visible
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    child: _buildSignInForm(
                      context,
                      height,
                      list,
                      signInWidgets,
                      _repeatPasswordController,
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
        mediumScreen: _buildSignInForm(context, height, list, signInWidgets,
            _repeatPasswordController), // Pasar _repeatPasswordController como argumento
        smallScreen: _buildSignInForm(context, height, list, signInWidgets,
            _repeatPasswordController), // Pasar _repeatPasswordController como argumento
      ),
    );
  }

  Widget _buildSignInForm(
      BuildContext context,
      double height,
      List<TextEditingController> list,
      SignInWidgets signInWidgets,
      TextEditingController repeatPasswordController) {
    return SizedBox(
      height: height,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Centrar verticalmente
            crossAxisAlignment: CrossAxisAlignment.center, // Centrar horizontalmente
            children: [
              // signInWidgets.buildTitle(context),
              SizedBox(height: height * 0.20),
              signInWidgets.buildField(
                  context,
                  AppLocalizations.of(context)!.putName,
                  Icons.abc,
                  false,
                  list[0]),
              SizedBox(height: height * 0.02),
              signInWidgets.buildField(
                  context,
                  AppLocalizations.of(context)!.enterEmail,
                  Icons.email,
                  false,
                  list[1]), // Usar el segundo controlador de la lista
              SizedBox(height: height * 0.02),
              signInWidgets.buildField(
                  context,
                  AppLocalizations.of(context)!.putAddress,
                  Icons.house,
                  false,
                  list[2]), // Usar el tercer controlador de la lista
              SizedBox(height: height * 0.02),
              signInWidgets.buildField(
                  context,
                  AppLocalizations.of(context)!.enterPassword,
                  Icons.password,
                  false,
                  list[3]), // Usar el cuarto controlador de la lista
              SizedBox(height: height * 0.02),
              signInWidgets.buildField(
                  context,
                  AppLocalizations.of(context)!.repeatPassword,
                  Icons.repeat,
                  false,
                  repeatPasswordController), // Usar _repeatPasswordController
              SizedBox(height: height * 0.04),
              signInWidgets.buildForgotPasswordButton(context),
              SizedBox(height: height * 0.04),
              signInWidgets.buildSignInButton(context, list),
            ],
          ),
        ),
      ),
    );
  }
}
