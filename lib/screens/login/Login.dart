import 'package:ecommerce/constant/baseurls.dart';
import 'package:ecommerce/widgets/shared/CustomTextForm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/responsive/ResponsiveWidget.dart';
import '../../constant/AppColors.dart';
import 'package:ecommerce/widgets/shared/sigin/SignInForm.dart';

import '../../widgets/shared/CustomCircleImage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? AppBar(backgroundColor: AppColors.MIDNIGHTGREEN)
          : null,
      body: ResponsiveWidget(
        largeScreen: Row(
          children: [
            Expanded(
              child: Container(
                color: AppColors.MIDNIGHTGREEN,
                child: CustomCircleImage(),
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

                ],
              ),
            ),
          ],
        ),
        // mediumScreen: _buildSignInForm(
        //     context, height, list, signInWidgets, _repeatPasswordController),
        // // Pasar _repeatPasswordController como argumento
        // smallScreen: _buildSignInForm(context, height / 2, list, signInWidgets,
        //     _repeatPasswordController),
      ),
    );
  }

  Widget loginForm(
      BuildContext context,
      double height,
      List<TextEditingController> list,
      TextEditingController repeatPasswordController) {
    return Column(
      children: [
        SizedBox(height: height * 0.25),
        SizedBox(height: height * 0.015),
        const Column(
          children: [

          ],
        ),
      ],
    );
  }
}