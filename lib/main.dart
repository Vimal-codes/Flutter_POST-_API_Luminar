import 'package:flutter/material.dart';
import 'package:flutter_post_api_luminar/screens/home.dart';
import 'package:flutter_post_api_luminar/screens/login.dart';
import 'package:flutter_post_api_luminar/screens/registration.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
      initialRoute: '/login',
      routes: {
        '/login' : (context) => LoginScreen(),
        '/register' : (context) => RegistrationPage(),
        '/home' : (context) => HomeScreen(),
      },
    );
  }
}
