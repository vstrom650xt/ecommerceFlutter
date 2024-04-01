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
          children: [
            ResponsiveWidget.isSmallScreen(context)
                ? const SizedBox()
                : Expanded(
              child: Container(
                height: height,
                color: AppColors.MIDNIGHTGREEN,
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                height: height,
                color: AppColors.WHITE,
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    vertical: height * 0.05,
                    horizontal: ResponsiveWidget.isSmallScreen(context)
                        ? 20.0
                        : width * 0.1,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: height * 0.1),
                      Center(
                        child: RichText(
                          text: TextSpan(
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
                                  color: AppColors.MIDNIGHTGREEN,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.02),
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          hintText: AppLocalizations.of(context)!.enterEmail,
                        ),
                      ),
                      SizedBox(height: height * 0.02),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.password),
                          hintText: AppLocalizations.of(context)!.enterPassword,
                        ),
                      ),
                      SizedBox(height: height * 0.03),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CupertinoButton(
                            onPressed: () {},
                            padding: EdgeInsets.zero,
                            child: Image.network(
                              BaseUrls.IMGURLS + 'iconos/google.png',
                              height: height * 0.07,
                            ),
                          ),
                          SizedBox(width: width * 0.015),
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
                              padding: EdgeInsets.symmetric(
                                horizontal: width * 0.1,
                                vertical: height * 0.02,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16.0),
                                color: AppColors.MIDNIGHTGREEN,
                              ),
                              child: Text(
                                AppLocalizations.of(context)!.signing,
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ),
                          ),
                        ),
                      ),
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
