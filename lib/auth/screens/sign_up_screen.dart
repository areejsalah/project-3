import 'package:flutter/material.dart';
import 'package:flutter_application_1/app%20router/app_router.dart';
import 'package:flutter_application_1/auth/components/custom_text_field.dart';
import 'package:flutter_application_1/auth/providers/auth_provider.dart';
import 'package:flutter_application_1/auth/screens/sign_in_screen.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Consumer<AuthProvider>(builder: (context, provider, x) {
            return Form(
                key: provider.signUpKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 30),
                        child: const Text(
                          'Register',
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                      ),
                      CustomTextfield(
                        validation: provider.requiredValidation,
                        label: 'Name',
                        controller: provider.nameController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextfield(
                        validation: provider.emailValidation,
                        label: 'Email',
                        controller: provider.registerEmailController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextfield(
                        validation: provider.passwordValidation,
                        label: 'password',
                        controller: provider.registerPasswordController,
                        isPassword: true,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextfield(
                        validation: provider.phoneValidation,
                        label: 'Phone Number',
                        controller: provider.phoneNumberController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            provider.sigUp();
                          },
                          child: const Text('Sign Up')),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            AppRouter.appRouter
                                .goToWidgetAndReplace(SignInScreen());
                          },
                          child: const Text('Go to login Page'))
                    ],
                  ),
                ));
          }),
        ),
      ),
    );
  }
}
