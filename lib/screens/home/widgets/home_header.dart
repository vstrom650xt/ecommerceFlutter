import 'package:ecommerce/apicalls/auth/ProvidersAuth.dart';
import 'package:ecommerce/constant/AppColors.dart';
import 'package:ecommerce/model/Cart.dart';
import 'package:ecommerce/screens/adminpanel/DashBoardScreen.dart';
import 'package:ecommerce/screens/home/home_screen.dart';
import 'package:ecommerce/screens/login/Login.dart';
import 'package:ecommerce/screens/sigin/SignIn.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../cart/cart_screen.dart';
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
              final user = snapshot.data;
              final isLoggedIn = snapshot.hasData;
              final isPruebaPanelUser = user?.email == 'pruebapanel@gmail.com';

              return PopupMenuButton(
                onSelected: (value) {
                  switch (value) {
                    case 'dashboard':
                    // Lógica para ir al Dashboard
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DashboardScreen()),
                      );
                      break;
                    case 'logout':
                    // Lógica para cerrar sesión
                      Auth.signOutFromGoogle();
                      break;
                    case 'login':
                    // Lógica para iniciar sesión
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                      break;
                    case 'register':
                    // Lógica para registrarse
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignIn()),
                      );
                      break;
                    default:
                      break;
                  }
                },
                icon: isLoggedIn
                    ? Icon(Icons.account_circle,
                    color: AppColors.PERSIMON)
                    : Icon(Icons.account_circle_outlined,
                    color: AppColors.PERSIMON),
                itemBuilder: (BuildContext context) => isLoggedIn
                    ? isPruebaPanelUser
                    ? <PopupMenuEntry>[
                  const PopupMenuItem(
                    value: 'dashboard',
                    child: Text('Dashboard'),
                  ),
                  const PopupMenuItem(
                    value: 'logout',
                    child: Text('Cerrar sesión'),
                  ),
                ]
                    : <PopupMenuEntry>[
                  const PopupMenuItem(
                    value: 'logout',
                    child: Text('Cerrar sesión'),
                  ),
                ]
                    : <PopupMenuEntry>[
                  const PopupMenuItem(
                    value: 'login',
                    child: Text('Iniciar sesión'),
                  ),
                  const PopupMenuItem(
                    value: 'register',
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
