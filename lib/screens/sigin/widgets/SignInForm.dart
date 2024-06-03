import 'package:flutter/material.dart';
import 'package:ecommerce/screens/home/home_screen.dart';
import 'package:ecommerce/screens/sigin/controller/ControllerSignIn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../widgets/shared/CustomButton.dart';
import '../../../widgets/shared/CustomTextForm.dart';
import '../../../widgets/shared/CustomTitle.dart';

class SignInForm extends StatefulWidget {
  final double height;
  final List<TextEditingController> list;

  const SignInForm({
    Key? key,
    required this.height,
    required this.list,
  }) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _addressController;
  late TextEditingController _passwordController;
  late TextEditingController _repeatPasswordController;

  @override
  void initState() {
    super.initState();
    _nameController = widget.list[0];
    _emailController = widget.list[1];
    _addressController = widget.list[2];
    _passwordController = widget.list[3];
    _repeatPasswordController = widget.list[4];
  }

  @override
  Widget build(BuildContext context) {
    ControllerSignIn controllerSignIn = ControllerSignIn();
    return Column(
      children: [
        SizedBox(height: widget.height * 0.25),
        CustomTitle(text: AppLocalizations.of(context)!.createAccount),
        SizedBox(height: widget.height * 0.015),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: widget.height * 0.015),
                Center(
                  child: SizedBox(
                    width: 300,
                    child: CustomTextForm(
                      text: '',
                      iconData: Icons.abc,
                      obscureText: false,
                      controller: _nameController,
                      label: AppLocalizations.of(context)!.putName,
                      tooltipText: '',
                    ),
                  ),
                ),
                SizedBox(height: widget.height * 0.015),
                Center(
                  child: SizedBox(
                    width: 300,
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
                    width: 300,
                    child: CustomTextForm(
                      text: '',
                      iconData: Icons.house,
                      obscureText: false,
                      controller: _addressController,
                      label: AppLocalizations.of(context)!.putAddress,
                      tooltipText: '',
                    ),
                  ),
                ),
                SizedBox(height: widget.height * 0.015),
                Center(
                  child: SizedBox(
                    width: 300,
                    child: CustomTextForm(
                      text: '',
                      iconData: Icons.password,
                      obscureText: true,
                      controller: _passwordController,
                      label: AppLocalizations.of(context)!.putPassword,
                      tooltipText: AppLocalizations.of(context)!
                          .passwordTooltip
                          .replaceAll('\\n', '\n'),
                    ),
                  ),
                ),
                SizedBox(height: widget.height * 0.015),
                Center(
                  child: SizedBox(
                    width: 300,
                    child: CustomTextForm(
                        text: '',
                        iconData: Icons.repeat,
                        obscureText: true,
                        controller: _repeatPasswordController,
                        label: AppLocalizations.of(context)!.repeatPassword,
                        tooltipText: ''),
                  ),
                ),
                SizedBox(height: widget.height * 0.04),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomButton(
                      listTextEditingController: widget.list,
                      text: 'Crear cuenta',
                      onTap: () async {
                        // Aplicar .trim() a los valores
                        _nameController.text = _nameController.text.trim();
                        _emailController.text = _emailController.text.trim();
                        _addressController.text = _addressController.text.trim();
                        _passwordController.text = _passwordController.text.trim();
                        _repeatPasswordController.text = _repeatPasswordController.text.trim();

                        bool successRegister = await controllerSignIn.sigIn(context, widget.list);
                        if (successRegister) {
                          try {
                            await FirebaseAuth.instance.signInWithEmailAndPassword(
                                email: _emailController.text,
                                password: _passwordController.text);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const HomeScreen()),
                            );
                          } catch (error) {
                            print("Error al iniciar sesión: $error");
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Ha ocurrido un error al iniciar sesión'),
                              ),
                            );
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Hemos tenido un problema la registrar su usuario'),
                            ),
                          );
                        }
                      }),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
