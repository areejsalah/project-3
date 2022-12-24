import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/app%20router/app_router.dart';
import 'package:flutter_application_1/auth/providers/auth_provider.dart';
import 'package:flutter_application_1/auth/screens/home.dart';
import 'package:flutter_application_1/auth/screens/main_screen.dart';
import 'package:flutter_application_1/auth/screens/sign_in_screen.dart';
import 'package:flutter_application_1/auth/screens/splash_screen.dart';
import 'package:flutter_application_1/customer/views/screens/all_products_screens.dart';
import 'package:flutter_application_1/customer/views/screens/custom_main_screen.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:provider/provider.dart';

import 'admin/providers/admin_provider.dart';
import 'admin/views/screens/main_admin_screen.dart';
import 'auth/screens/sign_up_screen.dart';
import 'customer/views/screens/detailed_project_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (context) {
            return AuthProvider();
          },
        ),
        ChangeNotifierProvider<AdminProvider>(
          create: (context) {
            return AdminProvider();
          },
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        navigatorKey: AppRouter.appRouter.navigatorKey,
        title: 'Food Delivery App',
        // theme: ThemeData(fontFamily: "Gilroy"),
        home: SplashScreen(),
      ),
    );
  }
}
