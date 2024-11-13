import 'package:flutter/material.dart';
import 'package:flutter_post_api_luminar/service/apiService.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  ApiSrevice apiSrevice = ApiSrevice();

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
                     await apiSrevice.login(emailController.text, passwordController.text);
                  }
                }, child: Text("Login")),
                ElevatedButton(onPressed: () {}, child: Text("SignUp"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
