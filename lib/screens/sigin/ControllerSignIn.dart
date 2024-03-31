import 'package:ecommerce/shared/CustomAlert.dart';

class ControllerSignIn{

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


  bool isStrongPassword(String password) {
    const passwordRegex = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    if (!RegExp(passwordRegex).hasMatch(password)) {
      print('La contraseña debe tener al menos 8 caracteres, una letra mayúscula, una letra minúscula, un dígito y un carácter especial.');
      return false;
    }
    return true;
  }
}
