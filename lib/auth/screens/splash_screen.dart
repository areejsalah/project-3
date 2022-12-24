import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/app%20router/app_router.dart';
import 'package:flutter_application_1/auth/providers/auth_provider.dart';
import 'package:flutter_application_1/customer/views/screens/custom_main_screen.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  @override
  @override
  Widget build(BuildContext context) {
    Provider.of<AuthProvider>(context, listen: false).checkUser();
    return Scaffold(
        backgroundColor: Color(0xffC3211A),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              image: const DecorationImage(
                  image: AssetImage(
                    'assets/user.png',
                  ),
                  fit: BoxFit.cover),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text(
                'WelcoMeal ',
                style: TextStyle(
                  fontFamily: 'Dancing',
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'Bello',
                style: TextStyle(
                  fontFamily: 'Dancing',
                  color: Colors.black,
                  fontSize: 35,
                  fontWeight: FontWeight.w200,
                ),
              ),
            ],
          ),
        ])));
  }
}
