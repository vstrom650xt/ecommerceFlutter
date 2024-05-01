import 'package:ecommerce/constant/baseurls.dart';
import 'package:ecommerce/screens/login/widgets/LoginForm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/responsive/ResponsiveWidget.dart';
import '../../constant/AppColors.dart';

import '../../widgets/shared/CustomCircleImage.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    var list = [
      _emailController,
      _passwordController,
    ];

    return Scaffold(
      appBar: ResponsiveWidget.isSmallScreen(context) ||  ResponsiveWidget.isMediumScreen(context)
          ? AppBar(backgroundColor: AppColors.MIDNIGHTGREEN)
          : null,
      body: ResponsiveWidget(
        largeScreen: Row(
          children: [
            Expanded(
              child: Container(
                color: AppColors.MIDNIGHTGREEN,
                child: const CustomCircleImage(),
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
                  LoginForm(context: context, height: height, list: list)
                ],
              ),
            ),
          ],
        ),
        mediumScreen: LoginForm(context: context, height: height / 2, list: list),
        smallScreen:LoginForm(context: context, height: height / 2.5, list: list)
      ),
    );
  }
}
