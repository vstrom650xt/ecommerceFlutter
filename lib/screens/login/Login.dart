import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:ecommerce/constant/baseurls.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter/material.dart';
import 'package:ecommerce/responsive/ResponsiveWidget.dart';
import '../../constant/AppColors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

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
                      height: height ,
                      color: AppColors.mainBlueColor,
                    ),
                  ),
            Expanded(
              flex: 2, // Asigna más espacio al contenedor blanco
              child: Container(
                height: height,
                color: AppColors.backColor,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 40.0),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: height * 0.2),
                        Center(
                          child: RichText(
                            text:  TextSpan(
                              children: [
                                TextSpan(
                                  text: AppLocalizations.of(context)!.lets,
                                  style: const TextStyle(
                                    fontSize: 24,
                                  ),
                                ),
                                TextSpan(
                                  text: AppLocalizations.of(context)!.signing,
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.mainBlueColor, // Puedes ajustar el color según sea necesario
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: height * 0.02),
                        SizedBox(height: height * 0.064),
                        const SizedBox(height: 6.0),
                        Center(
                          child: Container(
                            height: 50.0,
                            width: width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              color: AppColors.whiteColor,
                            ),
                            child: TextFormField(

                              decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.email),
                                ),
                                contentPadding:
                                    const EdgeInsets.only(top: 12.0),
                                hintText: AppLocalizations.of(context)!.enterEmail,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: height * 0.014),
                        const SizedBox(height: 6.0),
                        Center(
                          child: Container(
                            height: 50.0,
                            width: width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.0),
                              color: AppColors.whiteColor,
                            ),
                            child: TextFormField(
                              obscureText: true,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.password),
                                ),
                                contentPadding:
                                    const EdgeInsets.only(top: 12.0),
                                hintText:AppLocalizations.of(context)!.enterPassword,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: height * 0.03),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          //  crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CupertinoButton(
                              onPressed: () {},
                              padding: EdgeInsets.zero,
                              child: Image.network(
                                BaseUrls.IMGURLS + 'iconos/google.png',
                                height: height * 0.07,
                              ),
                            ),
                            SizedBox(
                              width: width * 0.015,
                            ),
                            CupertinoButton(
                              onPressed: () {},
                              padding: EdgeInsets.zero,
                              child: Icon(
                                Icons.facebook,
                                color: Colors.blue,
                                size: height * 0.08,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: height * 0.03),
                        Align(
                          alignment: Alignment.center,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(AppLocalizations.of(context)!.forgotPassword),
                          ),
                        ),
                        SizedBox(height: height * 0.05),
                        Center(
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {},
                              borderRadius: BorderRadius.circular(16.0),
                              child: Ink(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 70.0, vertical: 18.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.0),
                                  color: AppColors.mainBlueColor,
                                ),
                                child: Text(AppLocalizations.of(context)!.signing),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
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