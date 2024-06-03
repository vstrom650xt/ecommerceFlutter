import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../apicalls/user/ApiUser.dart';
import '../../../widgets/shared/CustomDialog.dart';

class ControllerSignIn {
  bool isStrongPassword(String password) {
    const passwordRegex = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    return RegExp(passwordRegex).hasMatch(password);
  }

  bool arePasswordsEqual(String password, String repeatPassword) {
    return password.isNotEmpty && repeatPassword.isNotEmpty && password == repeatPassword;
  }

  bool isValidEmail(String email) {
    const emailRegex = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    return RegExp(emailRegex).hasMatch(email);
  }

  Future<bool> sigIn(BuildContext context, List<TextEditingController> listTextEditingController) async {
    bool areValuesValid = validateValues(listTextEditingController);
    if (!areValuesValid) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Rellene todos los campos')),
      );
      return false;
    }

    ApiUser apiUser = ApiUser();
    bool saved = await apiUser.saveUser(listTextEditingController, context);
    if (!saved) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error al guardar el usuario en el servidor')),
      );
      return false;
    }

    bool success = await createUserAuthFirebase(
      listTextEditingController[1].text,
      listTextEditingController[3].text,
    );

    if (!success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error al crear el usuario en Firebase')),
      );
      return false;
    }

    await sendEmailVerification();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Se ha enviado un correo de verificación. Por favor, verifique su correo.')),
    );

    return true;
  }

  bool validateValues(List<TextEditingController> controllers) {
    for (var controller in controllers) {
      if (controller.text.isEmpty) {
        return false;
      }
    }
    return true;
  }

  Future<void> sendEmailVerification() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
        print('Email verification sent!');
      }
    } catch (error) {
      print('Error sending email verification: $error');
    }
  }

  Future<bool> createUserAuthFirebase(String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true;
    } catch (error) {
      if (error is FirebaseAuthException && error.code == 'email-already-in-use') {
        print('El correo electrónico ya está registrado.');
      } else {
        print('Error creating user: $error');
      }
      return false;
    }
  }

  Future<bool> isEmailVerified() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await user.reload();
        return user.emailVerified;
      }
      return false;
    } catch (error) {
      print('Error checking email verification: $error');
      return false;
    }
  }
}
