import 'dart:convert' show json;
import 'package:ecommerce/screens/sigin/ControllerSignIn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../constant/baseurls.dart';
import 'package:ecommerce/utils/EncryptPassword.dart';
import '../widgets/shared/CustomDialog.dart';

class ApiUser {
  Future<bool> saveUser(
      List<TextEditingController> values, BuildContext context) async {
    ControllerSignIn controllerSignIn = ControllerSignIn();
    final url = Uri.parse(BaseUrls.BASEURLAPI + 'users/save/');
    String name = values[0].text;
    String email = values[1].text;
    String address = values[2].text;
    String password = values[3].text;
    String repeatPassword = values[4].text;
    DateTime creationDate = DateTime.now();
    DateTime? modifiedDate;
    String formattedDate =
        DateFormat('yyyy-MM-ddTHH:mm:ss.SSSZ').format(creationDate);
    String encryptedPassword = EncryptPassword.hashPassword(password);
    bool savedSuccessfully = false;

    if (!controllerSignIn.arePasswordsEqual(password, repeatPassword)) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const CustomDialog(
            textoSuperior: " ",
            textInferior: "contraseñas no iguales",
          );
        },
      );
      return savedSuccessfully;
    }

    if (!controllerSignIn.isStrongPassword(password)) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const CustomDialog(
            textoSuperior: " ",
            textInferior: "contraseña debil ",
          );
        },
      );
      print('La contraseña no es lo suficientemente fuerte.');
      return savedSuccessfully;
    }

    if (!controllerSignIn.isValidEmail(email)) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const CustomDialog(
            textoSuperior: " ",
            textInferior: "formato del correo electrónico no es válido",
          );
        },
      );
      print('El formato del correo electrónico no es válido.');
      return savedSuccessfully;
    }

    Map<String, dynamic> userData = {
      'name': name,
      'email': email,
      'address': address,
      'password': encryptedPassword,
      'creationDate': formattedDate,
      'modifedDate': modifiedDate,
    };

    String jsonData = json.encode(userData);

    try {
      var response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonData,
      );

      if (response.statusCode == 200) {
        print('Datos guardados con éxito.');
        savedSuccessfully =
            true; // Cambiar el valor a true si se guardan correctamente
      } else {
        print(
            'Error al guardar los datos. Código de estado: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }

    return savedSuccessfully; // Devolver el valor actualizado
  }
}
