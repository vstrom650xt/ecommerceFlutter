import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart'; // Add this import
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

const List<String> scopes = <String>[
  'email',
  'https://www.googleapis.com/auth/contacts.readonly',
];

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? get currentUser => _auth.currentUser;
  Stream<User?> get authStateChange => _auth.authStateChanges();

  static Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Return the authenticated user from UserCredential
      return userCredential.user;
    } catch (e) {
      // Error handling, you can print the error if needed
      print('Error signing in: $e');
      return null; // Return null in case of error
    }
  }

  static Future<User?> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    await auth.createUserWithEmailAndPassword(email: email, password: password);
    return user;
  }

  static Future<dynamic> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on Exception catch (e) {
      // Handle exceptions
      print('Exception->$e');
      return null;
    }
  }

  static Future<UserCredential?> signInWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      if (loginResult.accessToken == null) {
        print('Facebook sign-in failed: Access token is null');
        return null;
      }

      final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

      return await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    } catch (e) {
      print('Error signing in with Facebook: $e');
      return null;
    }
  }
  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<bool> signOutFromGoogle() async {
    try {
      await FirebaseAuth.instance.signOut();
      return true;
    } on Exception catch (_) {
      return false;
    }
  }
}
