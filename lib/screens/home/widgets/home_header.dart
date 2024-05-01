import 'package:ecommerce/apicalls/auth/ProvidersAuth.dart';
import 'package:ecommerce/constant/AppColors.dart';
import 'package:ecommerce/screens/home/home_screen.dart';
import 'package:ecommerce/screens/login/Login.dart';
import 'package:ecommerce/screens/sigin/SignIn.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'icon_btn_with_counter.dart';
import 'search_field.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(child: SearchField()),
          const SizedBox(width: 16),
          IconBtnWithCounter(
            press: () => Navigator.pushNamed(context, ''),
            icon: Icons.shopping_cart,
          ),
          const SizedBox(width: 8),
          StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              final isLoggedIn = snapshot.hasData;
              return PopupMenuButton(
                onSelected: (value) {
                  switch (value) {
                    case 1:
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const HomeScreen()),
                      );
                      break;
                    case 2:
                    // Aquí puedes definir la lógica para la opción de configuración
                      break;
                    case 3:
                      Auth.signOutFromGoogle();
                    // Aquí puedes definir la lógica para cerrar sesión
                      break;
                    case 4:
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginScreen()),
                      );
                      break;
                    case 5:
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignIn()),
                      );
                      break;
                    default:
                      break;
                  }
                },
                icon: isLoggedIn
                    ? Icon(Icons.account_circle, color: AppColors.PERSIMON)
                    : Icon(Icons.account_circle_outlined, color: AppColors.PERSIMON),
                itemBuilder: (BuildContext context) => isLoggedIn
                    ? <PopupMenuEntry>[
                  PopupMenuItem(
                    value: 1,
                    child: Text('Perfil'),
                  ),
                  const PopupMenuItem(
                    value: 2,
                    child: Text('Configuración'),
                  ),
                  const PopupMenuItem(
                    value: 3,
                    child: Text('Cerrar sesión'),
                  ),
                ]
                    : <PopupMenuEntry>[
                  PopupMenuItem(
                    value: 4,
                    child: Text('Iniciar sesión'),
                  ),
                  PopupMenuItem(
                    value: 5,
                    child: Text('Registrarse'),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
