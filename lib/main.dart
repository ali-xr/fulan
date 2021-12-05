import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fulanapp/auth/login_screen.dart';
import 'package:fulanapp/auth/registor.dart';
import 'package:fulanapp/home/student_home_page.dart';
import 'package:fulanapp/investor/investor_screen.dart';
import 'package:fulanapp/investor/student_item.dart';
import 'package:fulanapp/splash/splash_screen.dart';
import 'package:fulanapp/variables/variables.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  HttpOverrides.global = MyHttpOverrides();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tingla',
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: FutureBuilder(
        future: SharedPreferences.getInstance(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            Variables.prefs = snapshot.data;

            // Variables.prefs!.setString('token', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6ImQ1MTJkOTI4LWU0YWItNDhlMi04M2U5LTVhZjE5MWI1MTY3NyIsImlhdCI6MTYzODY4OTYzM30.lHQrLr235pyr2oP0AN6doyMm6Jr6DeFuJ0nCJ3bfAVM');

            Variables.userToken = Variables.prefs!.getString('token');
            Variables.role = Variables.prefs!.getString('role');

            print(Variables.userToken);

            if (Variables.userToken != null) {
              if (Variables.role == null) {
                return const SplashScreen(child: EndScreen());
              } else {
                if (Variables.role == 'student') {
                  return const SplashScreen(child: StudentHome());
                } else {
                  return const SplashScreen(child: Investor());
                }
              }
            } else {
              return const SplashScreen(child: CheckPhoneNumberScreen());
            }
          }
          return const SplashScreen();
        },
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
