
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../apicalls/user/ApiUser.dart';
import '../../widgets/shared/CustomDialog.dart';
class ControllerSignIn {
  /*
  * La contraseña debe tener al menos 8 caracteres
  * Al menos una letra mayúscula
  * Al menos una letra minúscula
  * Al menos un dígito
  * Al menos un carácter especial (e.g. !@#%^&*)
  *
  * */

  bool isStrongPassword(String password) {
    const passwordRegex = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    if (!RegExp(passwordRegex).hasMatch(password)) {
      print(
          'La contraseña debe tener al menos 8 caracteres, una letra mayúscula, una letra minúscula, un dígito y un carácter especial.');
      return false;
    }
    return true;
  }


  bool arePasswordsEqual(String password, String repeatPassword) {
    if (password.isNotEmpty && repeatPassword.isNotEmpty) {
      return password == repeatPassword;
    }
    return false;
  }


  bool isValidEmail(String email) {
    const emailRegex =
        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    return RegExp(emailRegex).hasMatch(email);
  }


  Future<void> sigIn(BuildContext context,
      List<TextEditingController> listTextEditingController) async {
    bool areValuesValid = validateValues(listTextEditingController);
    if (!areValuesValid) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const CustomDialog(
            textoSuperior: " Rellene todos los campos",
            textInferior: "",
          );
        },
      );
    } else {
      ApiUser apiUser = ApiUser();
      bool saved =
      await apiUser.saveUser(listTextEditingController, context);
      if (saved) {
        createUserAuthFirebase(listTextEditingController[1].text,listTextEditingController[3].text);
        sendEmailVerification();
        while(await isEmailVerified()){
            const CustomDialog(
            textoSuperior: "",
            textInferior: "esperando a q verifiqes email",
          );

        }
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const CustomDialog(
              textoSuperior: "",
              textInferior: "dentro",
            );
          },
        );
      } else {
        // for (var controller in listTextEditingController) {
        //   controller.clear();
        // }
      }
    }
  }


  bool validateValues(List<TextEditingController> controllers) {
    for (var controller in controllers) {
      if (controller.text.isEmpty) {
        return false;
      }
    }
    return true;
  }

  //mensaje de verificacion y añadir a auth
  Future<void> sendEmailVerification() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
        print('Email verification sent!');

        if (user.emailVerified) {
          print('El correo electrónico ha sido verificado.');
        } else {
          print('El correo electrónico no ha sido verificado aún.');
        }
      } else {
        print('No user logged in or email already verified');
      }
    } catch (error) {
      String errorMessage = error.toString();

      print(errorMessage);
    }
  }

  Future<void> createUserAuthFirebase(String email,String password) async {
    try {
      // Intentamos crear un usuario con el correo electrónico dado.
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password, // Se necesita una contraseña, pero no la usaremos realmente.
      );

    } catch (error) {
      // Si hay un error, verificamos si es debido a que el correo electrónico ya está registrado.
      if (error is FirebaseAuthException) {
        if (error.code == 'email-already-in-use') {
          // El correo electrónico ya está registrado.
        }
      }
      rethrow;    }
  }

  Future<bool> isEmailRegistered(String email,String password) async {
    try {
      // Intentamos crear un usuario con el correo electrónico dado.
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password, // Se necesita una contraseña, pero no la usaremos realmente.
      );

      // Si la creación de usuario es exitosa, significa que el correo electrónico no está registrado.
      return false;
    } catch (error) {
      // Si hay un error, verificamos si es debido a que el correo electrónico ya está registrado.
      if (error is FirebaseAuthException) {
        if (error.code == 'email-already-in-use') {
          // El correo electrónico ya está registrado.
          return true;
        }
      }
      // Manejar otros errores si es necesario.
      rethrow;
    }
  }

  Future<bool> isEmailVerified() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        await user.reload(); // Actualizamos los datos del usuario para asegurarnos de obtener la información más reciente.
        user = FirebaseAuth.instance.currentUser; // Volvemos a obtener el objeto de usuario actualizado.

        return user!.emailVerified;
      } else {
        // No hay usuario autenticado.
        return false;
      }
    } catch (error) {
      // Manejar error
      print('Error: $error');
      return false;
    }
  }


}