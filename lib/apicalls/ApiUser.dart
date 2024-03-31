import 'dart:convert';
import 'package:ecommerce/screens/sigin/ControllerSignIn.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../constant/baseurls.dart';
import 'package:ecommerce/utils/EncryptPassword.dart';

import '../shared/CustomAlert.dart';

class ApiUser {
  Future<void> saveUser(List<TextEditingController> values) async {
    ControllerSignIn controllerSignIn = ControllerSignIn();

    final url = Uri.parse(BaseUrls.BASEURLAPI + 'users/save/');

    String name = values[0].text;
    String email = values[1].text;
    String address = values[2].text;
    String password = values[3].text;
    String repeatPassword = values[4].text;
    DateTime creationDate = DateTime.now();
    late DateTime? modifiedDate = null;
    String formattedDate = DateFormat('yyyy-MM-ddTHH:mm:ss.SSSZ').format(creationDate);
    String encryptedPassword = EncryptPassword.hashPassword(password);

    if (name.isEmpty || email.isEmpty || address.isEmpty || password.isEmpty) {
      print('Todos los campos son obligatorios.');
      return;
    }

    if (!controllerSignIn.arePasswordsEqual(password, repeatPassword)) {
      print('Las contraseñas no coinciden.');
      return;
    }

    if (!controllerSignIn.isStrongPassword(password)) {
      print('La contraseña no es lo suficientemente fuerte.');
      return;
    }

    if (!controllerSignIn.isValidEmail(email)) {
      print('El formato del correo electrónico no es válido.');
      return;
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
      } else {
        print(
            'Error al guardar los datos. Código de estado: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
