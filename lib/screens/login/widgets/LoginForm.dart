import 'package:ecommerce/screens/home/home_screen.dart';
import 'package:ecommerce/screens/login/controller/LoginControler.dart';
import 'package:ecommerce/screens/login/widgets/IconRow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../widgets/shared/CustomButton.dart';
import '../../../widgets/shared/CustomTextForm.dart';
import '../../../widgets/shared/CustomTitle.dart';
import 'ForgotPasswordButton.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required this.context,
    required this.height,
    required this.list,
  });

  final BuildContext context;
  final double height;
  final List<TextEditingController> list;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: height * 0.30),
                CustomTitle(
                  text: AppLocalizations.of(context)!.signing,
                ),
                SizedBox(height: height * 0.050),
                Center(
                  child: SizedBox(
                    width: 200,
                    child: CustomTextForm(
                      text: '',
                      iconData: Icons.email,
                      obscureText: false,
                      controller: list[0],
                      label: AppLocalizations.of(context)!.putEmail,
                      tooltipText: '',
                    ),
                  ),
                ),
                SizedBox(height: height * 0.015),

                Center(
                  child: SizedBox(
                    width: 200,
                    child: CustomTextForm(
                      text: '',
                      iconData: Icons.password,
                      obscureText: true,
                      controller: list[1],
                      label: AppLocalizations.of(context)!.putPassword,
                      tooltipText: '',
                    ),
                  ),
                ),

                SizedBox(height: height * 0.01),
                IconRow(height: height),
                //SizedBox(height: height * 0.025),
                ForgotPasswordButton(),
                SizedBox(height: height * 0.03),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomButton(
                    listTextEditingController: list,
                    text: 'Iniciar Sesión',
                    onTap: () async {
                      try {
                        String email = list[0].text;
                        String password = list[1].text;

                        bool signInResult =
                            await LoginController.signInWithEmailAndPassword(
                                context, email, password);

                        if (signInResult) {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) => HomeScreen()),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  'Inicio de sesión fallido. Por favor, verifica tus credenciales.'),
                            ),
                          );
                        }
                      } catch (error) {
                        print('Error durante el inicio de sesión: $error');
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text('Error durante el inicio de sesión: $error'),
                          ),
                        );
                      }
                    },
                  ),
                ),

                //SizedBox(height: height * 0.050),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
