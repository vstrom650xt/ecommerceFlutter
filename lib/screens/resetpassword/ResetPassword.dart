import 'package:ecommerce/constant/baseurls.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/responsive/ResponsiveWidget.dart';
import 'package:flutter/widgets.dart';
import '../../constant/AppColors.dart';

import 'widgets/ResetPasswordForm.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? AppBar(backgroundColor: AppColors.MIDNIGHTGREEN)
          : AppBar(backgroundColor: AppColors.MIDNIGHTGREEN),
      body: ResponsiveWidget(
        largeScreen: Stack(
          children: [
            Image.network(
              '${BaseUrls.IMGURLS}corporativa/fondo.jpg',
              fit: BoxFit.cover,
              width: width,
              height: height,
            ),
            Center(
              child: ResetPasswordForm(),
            ),
          ],
        ),
        // mediumScreen: ,
        // smallScreen:,
      ),
    );
  }
}
