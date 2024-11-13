import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController placeController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Name"
              ),
              validator: (value){
                return value!.length < 1? "must fill": null;
              },
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: phoneController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Phone",
              ),
              validator: (value){
                return value!.length < 1? "must fill": null;
              },
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: placeController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Place"
              ),
              validator: (value){
                return value!.length < 1? "must fill": null;
              },
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: pincodeController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Pincode"
              ),
              validator: (value){
                return value!.length < 1? "must fill": null;
              },
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Email"
              ),
              validator: (value){
                return value!.length < 1? "must fill": null;
              },
            ),
            SizedBox(height: 10,),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Password"
              ),
              validator: (value){
                return value!.length < 1? "must fill": null;
              },
            ),
            SizedBox(height: 10,),
            ElevatedButton(
                onPressed: () async {
                  if(formkey.currentState!.validate()){
                    nameController.text;
                    int.parse(phoneController.text);
                    placeController.text;
                    int.parse(pincodeController.text);
                    emailController.text;
                    passwordController.text;
                  }
                },
                child: Text("Register"))
          ],
        ),
      ),
    );
  }
}
