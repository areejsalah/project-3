import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app%20router/app_router.dart';
import 'package:flutter_application_1/auth/screens/sign_up_screen.dart';
import 'package:flutter_application_1/customer/views/screens/custom_main_screen.dart';
import 'package:flutter_application_1/data_repositores/auth_helper.dart';
import 'package:flutter_application_1/auth/screens/main_screen.dart';
import 'package:flutter_application_1/auth/screens/sign_in_screen.dart';
import 'package:flutter_application_1/data_repositores/firestore_helper.dart';
import 'package:flutter_application_1/data_repositores/storage_helper.dart';
import 'package:flutter_application_1/auth/models/app_user.dart';
import 'package:image_picker/image_picker.dart';
import 'package:string_validator/string_validator.dart';

class AuthProvider extends ChangeNotifier {
  GlobalKey<FormState> signInKey = GlobalKey<FormState>();
  GlobalKey<FormState> signUpKey = GlobalKey<FormState>();

  TextEditingController registerEmailController = TextEditingController();
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  TextEditingController registerPasswordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  late String email;
  late String password;
  AppUser? loggedUser;
  saveEmail(String email) {
    this.email = email;
  }

  savePassword(String password) {
    this.password = password;
  }

  String? emailValidation(String email) {
    if (email == null || email.isEmpty) {
      return 'Required field';
    } else if (!(isEmail(email))) {
      return 'Incorrect Email Syntax';
    }
    return null;
  }

  String? passwordValidation(String password) {
    if (password == null || password.isEmpty) {
      return 'Required Field';
    } else if (password.length <= 6) {
      return 'Error, the password must be larger than 6 letters';
    }
    return null;
  }

  String? requiredValidation(String content) {
    if (content == null || content.isEmpty) {
      return 'Required Field';
    }
    return null;
  }

  String? phoneValidation(String content) {
    if (!(isNumeric(content))) {
      return 'In Correct Number Syntax';
    }
    return null;
  }

  signIn() async {
    if (signInKey.currentState!.validate()) {
      signInKey.currentState!.save();
      String? userId = await AuthHelper.authHelper
          .signIn(loginEmailController.text, loginPasswordController.text);
      if (userId != null) {
        loggedUser =
            await FirestoreHelper.firestoreHelper.getUserFromFirestore(userId);
        notifyListeners();
        AppRouter.appRouter.goToWidgetAndReplace(CustomerMainScreen());
      }
    }
  }

  sigUp() async {
    if (signUpKey.currentState!.validate()) {
      signUpKey.currentState!.save();
      String? userId = await AuthHelper.authHelper.signUp(
          registerEmailController.text, registerPasswordController.text);
      if (userId != null) {
        FirestoreHelper.firestoreHelper.addNewUser(AppUser(
            id: userId,
            email: registerEmailController.text,
            userName: nameController.text,
            phoneNumber: phoneNumberController.text));
        AppRouter.appRouter.goToWidgetAndReplace(CustomerMainScreen());
      }
    }
  }

  getUser(String id) async {
    loggedUser = await FirestoreHelper.firestoreHelper.getUserFromFirestore(id);
    loggedUser?.id = id;
    notifyListeners();
  }

  checkUser() async {
    await Future.delayed(const Duration(seconds: 3));
    String? userId = AuthHelper.authHelper.checkUser();

    if (userId != null) {
      getUser(userId);
      AppRouter.appRouter.goToWidgetAndReplace(CustomerMainScreen());
    } else {
      AppRouter.appRouter.goToWidgetAndReplace(SignInScreen());
    }
  }

  signOut() async {
    await AuthHelper.authHelper.signOut();
    AppRouter.appRouter.goToWidgetAndReplace(SignInScreen());
  }
}
