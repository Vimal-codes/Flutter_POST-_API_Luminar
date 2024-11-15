import 'package:flutter/material.dart';
import 'package:flutter_post_api_luminar/service/userservice.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SharedPreferenceHelper sharedPreferenceHelper = SharedPreferenceHelper();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {
            sharedPreferenceHelper.clearLoginData();
            Navigator.pushReplacementNamed(context, '/login');
          }, icon: Icon(Icons.logout_sharp))
        ],
      ),
    );
  }
}
