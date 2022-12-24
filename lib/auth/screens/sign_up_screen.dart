import 'package:flutter/material.dart';
import 'package:flutter_application_1/app%20router/app_router.dart';
import 'package:flutter_application_1/auth/components/custom_text_field.dart';
import 'package:flutter_application_1/auth/providers/auth_provider.dart';
import 'package:flutter_application_1/auth/screens/sign_in_screen.dart';
import 'package:flutter_application_1/constants/colors.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    image: const DecorationImage(
                        image: AssetImage(
                          'assets/user.png',
                        ),
                        fit: BoxFit.cover),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(2, 2),
                        blurRadius: 1,
                        color: Color.fromARGB(82, 0, 0, 0),
                      )
                    ]),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
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
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xffC3211A)),
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
                                style: ElevatedButton.styleFrom(
                                    primary: const Color(0xffC3211A),
                                    textStyle: const TextStyle(
                                      fontSize: 16,
                                    )),
                                onPressed: () {
                                  provider.sigUp();
                                },
                                child: const Text(
                                  'Sign Up',
                                  style: TextStyle(color: Colors.white),
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                const Text(
                                  'I already Have an Account ',
                                ),
                                GestureDetector(
                                  onTap: () {
                                    AppRouter.appRouter
                                        .goToWidgetAndReplace(SignInScreen());
                                  },
                                  child: const Text(
                                    "Login",
                                    style: TextStyle(color: Color(0xffC3211A)),
                                  ),
                                )
                              ],
                            )
                            /*  ElevatedButton(
                                onPressed: () {
                                  AppRouter.appRouter
                                      .goToWidgetAndReplace(SignInScreen());
                                },
                                child: const Text('Go to login Page'))*/
                          ],
                        ),
                      ));
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
