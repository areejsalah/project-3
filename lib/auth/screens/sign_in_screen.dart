import 'package:flutter/material.dart';
import 'package:flutter_application_1/app%20router/app_router.dart';
import 'package:flutter_application_1/auth/components/custom_text_field.dart';
import 'package:flutter_application_1/auth/providers/auth_provider.dart';
import 'package:flutter_application_1/auth/screens/sign_up_screen.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 100),
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
            Container(
              padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
              child: Consumer<AuthProvider>(builder: (context, provider, x) {
                return Form(
                    key: provider.signInKey,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 30),
                            child: const Text(
                              'Sign In',
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.bold),
                            ),
                          ),
                          CustomTextfield(
                            validation: provider.emailValidation,
                            label: 'Email',
                            controller: provider.loginEmailController,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextfield(
                            validation: provider.passwordValidation,
                            isPassword: true,
                            label: 'Password',
                            controller: provider.loginPasswordController,
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
                                provider.signIn();
                              },
                              child: const Text('Sign In')),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: const Color(0xffC3211A),
                                  textStyle: const TextStyle(
                                    fontSize: 16,
                                  )),
                              onPressed: () {
                                AppRouter.appRouter
                                    .goToWidgetAndReplace(SignUpScreen());
                              },
                              child: const Text('Go to sign Up Page'))
                        ],
                      ),
                    ));
              }),
            ),
          ],
        ),
      ),
    );
  }
}
// arooj.salah@gmail.com, password: 2663408
// momen22.omer@gmail.com, password: we can do it
//jihad.salah@gmail.com, password: jihad123456
