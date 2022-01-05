import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_core/firebase_core.dart';

class AuthService {
  final FirebaseAuth firebaseAuth;

  AuthService(this.firebaseAuth);

  //create user object based on firebaseUser
  // User? _userFromFirebaseUser(User user) {
  //   return user != null ? User(uid: user.uid) : null;
  // }

  //sign in email&password
  Future<String> signIn(
      {required String email, required String password}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return "signed in";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return ('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        return ('Wrong password provided for that user.');
      }
      return '';
    }
  }

  //sign out

  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  //register email&password

  Future<String> signUp(
      {required String email, required String password}) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return "signed Up";
    } on FirebaseAuthException catch (e) {
      return e.message!;
    }
  }

  //auth chage user stream
  Stream<User?> get authStateChanges => firebaseAuth.authStateChanges();

  //forget password
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      return firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    }
  }
}
