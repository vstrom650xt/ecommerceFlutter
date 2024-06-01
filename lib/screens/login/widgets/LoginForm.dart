import 'package:ecommerce/screens/home/home_screen.dart';
import 'package:ecommerce/screens/login/controller/LoginControler.dart';
import 'package:ecommerce/screens/login/widgets/IconRow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../widgets/shared/CustomButton.dart';
import '../../../widgets/shared/CustomTextForm.dart';
import '../../../widgets/shared/CustomTitle.dart';
import 'ForgotPasswordButton.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
    required this.context,
    required this.height,
    required this.list,
  }) : super(key: key);

  final BuildContext context;
  final double height;
  final List<TextEditingController> list;

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = widget.list[0];
    _passwordController = widget.list[1];
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: widget.height * 0.30),
          CustomTitle(
            text: AppLocalizations.of(context)!.signing,
          ),
          SizedBox(height: widget.height * 0.050),
          Center(
            child: SizedBox(
              width: 200,
              child: CustomTextForm(
                text: '',
                iconData: Icons.email,
                obscureText: false,
                controller: _emailController,
                label: AppLocalizations.of(context)!.putEmail,
                tooltipText: '',
              ),
            ),
          ),
          SizedBox(height: widget.height * 0.015),
          Center(
            child: SizedBox(
              width: 200,
              child: CustomTextForm(
                text: '',
                iconData: Icons.password,
                obscureText: true,
                controller: _passwordController,
                label: AppLocalizations.of(context)!.putPassword,
                tooltipText: '',
              ),
            ),
          ),
          SizedBox(height: widget.height * 0.01),
          IconRow(height: widget.height),
          ForgotPasswordButton(),
          SizedBox(height: widget.height * 0.03),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomButton(
              listTextEditingController: widget.list,
              text: 'Iniciar Sesión',
              onTap: () async {
                try {
                  String email = _emailController.text;
                  String password = _passwordController.text;

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
        ],
      ),
    );
  }
}
