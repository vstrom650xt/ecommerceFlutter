import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/screens/adminpanel/DashBoardScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/screens/home/home_screen.dart';

class LoginController {
  static Future<bool> signInWithEmailAndPassword(
      BuildContext context, String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      print('Usuario autenticado: ${userCredential.user!.uid}');

      // Verificar si el usuario es administrador
      DocumentSnapshot adminDoc = await FirebaseFirestore.instance
          .collection('admin')
          .doc('admin')
          .get();

      if (adminDoc.exists) {
        String adminEmail = adminDoc['usuario'];
        String adminPassword = adminDoc['contrasenya'];
        print('Datos de admin recuperados: usuario=$adminEmail, contraseña=$adminPassword');

        if (email == adminEmail && password == adminPassword) {
          print('El usuario es administrador, redirigiendo al Dashboard');
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => DashboardScreen()),
          );
        } else {
          print('El usuario no es administrador, redirigiendo a la pantalla principal');
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        }
      } else {
        print('El documento de administrador no existe.');
      }

      return true;
    } catch (e) {
      print('Error al iniciar sesión: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error al iniciar sesión: $e'),
        ),
      );

      return false;
    }
  }
}
