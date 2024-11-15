import 'package:flutter/material.dart';
import 'package:flutter_post_api_luminar/model/login/GetLoginData.dart';
import 'package:flutter_post_api_luminar/service/apiService.dart';

import '../service/userservice.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  ApiService apiService = ApiService();
  SharedPreferenceHelper helper=SharedPreferenceHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder()
              ),
              validator: (value){
                return value!.isEmpty ? "Must Fill" : null;
              },
            ),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder()
              ),
              validator: (value){
                return value!.isEmpty ? "Must Fill" : null;
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () async {
                  if(formkey.currentState!.validate()){
                   GetLoginData? res=  await apiService.login(emailController.text, passwordController.text);
                   if(res!=null){
                    await  helper.saveLoginData(res).then((value){
                      Navigator.pushReplacementNamed(context, '/home');
                    }) ;

                   }
                  }
                }, child: Text("Login")),
                ElevatedButton(onPressed: () {
                  Navigator.pushReplacementNamed(context, '/register');
                }, child: Text("SignUp"))
              ],
            )
          ],
        ),
      ),
    );
  }
}

