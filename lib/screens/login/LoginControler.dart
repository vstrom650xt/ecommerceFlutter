import 'package:firebase_auth/firebase_auth.dart';

class LoginController {
  static Future<void> sendPasswordResetEmail(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } catch (error) {
      String errorMessage = error.toString();

    }
  }
}
