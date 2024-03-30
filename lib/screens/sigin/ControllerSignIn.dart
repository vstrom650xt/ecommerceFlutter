import 'package:ecommerce/shared/CustomAlert.dart';

class ControllerSignIn{

  bool arePasswordsEqual(String password, String repeatPassword) {

    if(password == repeatPassword) {
      print(password);
      print(repeatPassword);

      return true;
    }
    if (password.isNotEmpty && repeatPassword.isNotEmpty) {
      return password == repeatPassword;
    }
    return false;
  }


}
