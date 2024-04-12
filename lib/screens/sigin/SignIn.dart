import 'package:ecommerce/widgets/shared/CustomCircleImage.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/constant/AppColors.dart';
import 'package:ecommerce/responsive/ResponsiveWidget.dart';
import 'package:ecommerce/widgets/sigin/SignInForm.dart';
import '../../constant/baseurls.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController addressController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController repeatPasswordController = TextEditingController();

    var list = [
      nameController,
      emailController,
      addressController,
      passwordController,
      repeatPasswordController
    ];

    return Scaffold(
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? AppBar(backgroundColor: AppColors.MIDNIGHTGREEN)
          : null,
      // Añadir AppBar solo en smallscreen
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
                  SignInForm(height: height, list: list)
                ],
              ),
            ),
          ],
        ),
        mediumScreen: SignInForm(height: height, list: list),
        smallScreen: SignInForm(height: height, list: list),
      ),
    );
  }
}
