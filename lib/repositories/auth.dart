import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  Future<UserCredential> signIn() async {
    final userCredential = await FirebaseAuth.instance.signInAnonymously();
    return userCredential;
  }
}
