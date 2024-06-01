import 'package:ecommerce/apicalls/auth/ProvidersAuth.dart';
import 'package:ecommerce/constant/AppColors.dart';
import 'package:ecommerce/model/Cart.dart';
import 'package:ecommerce/screens/home/home_screen.dart';
import 'package:ecommerce/screens/login/Login.dart';
import 'package:ecommerce/screens/sigin/SignIn.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../apicalls/LanguageProvider.dart';
import '../../cart/cart_screen.dart';
import 'icon_btn_with_counter.dart';
import 'search_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
            press: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const CartScreen()),
            ),
            icon: Icons.shopping_cart,
            numOfitem: Cart.instance.getTotalItems(),

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
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()),
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
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                      );
                      break;
                    case 5:
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SignIn()),
                      );
                      break;
                    case 6:
                      // Cambiar el idioma al pulsar el botón
                      Provider.of<LanguageProvider>(context, listen: false)
                          .toggleLanguage();
                      break;
                    default:
                      break;
                  }
                },
                icon: isLoggedIn
                    ? const Icon(Icons.account_circle,
                        color: AppColors.PERSIMON)
                    : const Icon(Icons.account_circle_outlined,
                        color: AppColors.PERSIMON),
                itemBuilder: (BuildContext context) => isLoggedIn
                    ? <PopupMenuEntry>[
                        const PopupMenuItem(
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
                        const PopupMenuItem(
                          value: 6,
                          child: Text('Cambiar idioma'),
                        ),
                      ]
                    : <PopupMenuEntry>[
                        const PopupMenuItem(
                          value: 4,
                          child: Text('Iniciar sesión'),
                        ),
                        const PopupMenuItem(
                          value: 5,
                          child: Text('Registrarse'),
                        ),
                        const PopupMenuItem(
                          value: 6,
                          child: Text('Cambiar idioma'),
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
