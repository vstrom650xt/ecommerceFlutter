import 'package:ecommerce/screens/home/home_screen.dart';
import 'package:ecommerce/screens/sigin/controller/ControllerSignIn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../apicalls/auth/ProvidersAuth.dart';
import '../../../widgets/shared/CustomButton.dart';
import '../../../widgets/shared/CustomDialog.dart';
import '../../../widgets/shared/CustomTextForm.dart';
import '../../../widgets/shared/CustomTitle.dart';

class SignInForm extends StatelessWidget {
  final double height;
  final List<TextEditingController> list;

  const SignInForm({
    super.key,
    required this.height,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    ControllerSignIn controllerSignIn = ControllerSignIn();
    return Column(
      children: [
        SizedBox(height: height * 0.25),
        CustomTitle(text: AppLocalizations.of(context)!.createAccount),
        SizedBox(height: height * 0.015),
        Column(
          children: [
            SizedBox(height: height * 0.015),
            Center(
              child: SizedBox(
                width: 300,
                child: CustomTextForm(
                  text: '',
                  iconData: Icons.abc,
                  obscureText: false,
                  controller: list[0],
                  label: AppLocalizations.of(context)!.putName,
                  tooltipText: '',
                ),
              ),
            ),
            SizedBox(height: height * 0.015),
            Center(
              child: SizedBox(
                width: 300,
                child: CustomTextForm(
                  text: '',
                  iconData: Icons.email,
                  obscureText: false,
                  controller: list[1],
                  label: AppLocalizations.of(context)!.putEmail,
                  tooltipText: '',
                ),
              ),
            ),
            SizedBox(height: height * 0.015),
            Center(
              child: SizedBox(
                width: 300,
                child: CustomTextForm(
                  text: '',
                  iconData: Icons.house,
                  obscureText: false,
                  controller: list[2],
                  label: AppLocalizations.of(context)!.putAddress,
                  tooltipText: '',
                ),
              ),
            ),
            SizedBox(height: height * 0.015),
            Center(
              child: SizedBox(
                width: 300,
                child: CustomTextForm(
                  text: '',
                  iconData: Icons.password,
                  obscureText: true,
                  controller: list[3],
                  label: AppLocalizations.of(context)!.putPassword,
                  tooltipText: AppLocalizations.of(context)!
                      .passwordTooltip
                      .replaceAll('\\n', '\n'),
                ),
              ),
            ),
            SizedBox(height: height * 0.015),
            Center(
              child: SizedBox(
                width: 300,
                child: CustomTextForm(
                    text: '',
                    iconData: Icons.repeat,
                    obscureText: true,
                    controller: list[4],
                    label: AppLocalizations.of(context)!.repeatPassword,
                    tooltipText: ''),
              ),
            ),
            SizedBox(height: height * 0.04),
            CustomButton(
                listTextEditingController: list,
                text: 'Crear cuenta',
                onTap: () async {
                  bool successRegister =
                      await controllerSignIn.sigIn(context, list);
                  if (successRegister) {
                    try {
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                          email: list[1].text, password: list[3].text);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()),
                      );
                    } catch (error) {
                      print("Error al iniciar sesión: $error");
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const CustomDialog(
                            textoSuperior: "",
                            textInferior:
                                "Ha ocurrido un error al iniciar sesión",
                          );
                        },
                      );
                    }
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const CustomDialog(
                          textoSuperior: "",
                          textInferior:
                              "Hemos tenido un problema la registrar su usuario",
                        );
                      },
                    );
                  }
                })
          ],
        ),
      ],
    );
  }
}
//pruebaslog@gmail.com
//
