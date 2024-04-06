
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../apicalls/ApiUser.dart';
import '../../shared/CustomDialog.dart';

class ControllerSignIn {


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

  /*
  * La contraseña debe tener al menos 8 caracteres
  * Al menos una letra mayúscula
  * Al menos una letra minúscula
  * Al menos un dígito
  * Al menos un carácter especial (e.g. !@#%^&*)
  *
  * */

  Future<void> sigIn(BuildContext context,
      List<TextEditingController> listTextEditingController) async {
    bool areValuesValid = validateValues(listTextEditingController);
    if (!areValuesValid) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const dialogo(
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
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const dialogo(
              textoSuperior: "",
              textInferior: "dentro",
            );
          },
        );
      } else {
        for (var controller in listTextEditingController) {
          controller.clear();
        }
      }
    }
  }

  bool isStrongPassword(String password) {
    const passwordRegex = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    if (!RegExp(passwordRegex).hasMatch(password)) {
      print(
          'La contraseña debe tener al menos 8 caracteres, una letra mayúscula, una letra minúscula, un dígito y un carácter especial.');
      return false;
    }
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

}