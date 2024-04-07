import 'package:ecommerce/widgets/shared/CustomButton.dart';
import 'package:ecommerce/widgets/shared/CustomCircleImage.dart';
import 'package:ecommerce/widgets/shared/CustomTextForm.dart';
import 'package:ecommerce/widgets/shared/CustomTitle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/constant/AppColors.dart';
import 'package:ecommerce/responsive/ResponsiveWidget.dart';
import 'package:ecommerce/widgets/shared/sigin/SignInForm.dart';
import '../../constant/baseurls.dart';

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
