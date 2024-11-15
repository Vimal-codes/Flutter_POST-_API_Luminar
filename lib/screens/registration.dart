import 'package:flutter/material.dart';
import 'package:flutter_post_api_luminar/service/apiService.dart';

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

  ApiService apiService = ApiService();


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
              validator: (value) {
                if (value!.isEmpty) {
                  return "This field is required.";
                } else if (value.length < 10) {  // For phone numbers
                  return "Enter a valid phone number.";
                }
                return null;
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
                    apiService.registration(
                        nameController.text,
                        int.parse(phoneController.text),
                        placeController.text,
                        int.parse(pincodeController.text),
                        emailController.text,
                        passwordController.text
                    );
                  }
                  Navigator.pushReplacementNamed(context, '/login');
                },
                child: Text("Register"))
          ],
        ),
      ),
    );
  }
}
