import 'dart:convert';

import 'package:crypto/crypto.dart';

class EncryptPassword{


  static  String hashPassword(String password) {
    var bytes = utf8.encode(password);
    var digest = sha256.convert(bytes);

    return digest.toString();
  }

  bool verifyPassword(String enteredPassword, String storedHash) {
    String enteredPasswordHash = hashPassword(enteredPassword);
    return enteredPasswordHash == storedHash;
  }


}




