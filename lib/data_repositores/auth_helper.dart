import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/app%20router/app_router.dart';

class AuthHelper {
  AuthHelper._();
  static AuthHelper authHelper = AuthHelper._();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Future<String?> signUp(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user!.uid;
    } on Exception catch (e) {
      AppRouter.appRouter
          .showCustomDialoug('Error in Registration', e.toString());
    }
  }

  Future<String?> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user?.uid;
    } on Exception catch (e) {
      AppRouter.appRouter
          .showCustomDialoug('Error in Authentication', e.toString());
    }
  }

  String? checkUser() {
    User? user = firebaseAuth.currentUser;
    return user?.uid;
  }

  signOut() async {
    await firebaseAuth.signOut();
  }

  resetPassword(String password) async {}
  verifyEmail() async {}
}
