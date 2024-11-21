import 'package:flutter/material.dart';
import 'package:flutter_post_api_luminar/service/apiService.dart';
import 'package:flutter_post_api_luminar/service/userservice.dart';

import '../model/product/Data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  SharedPreferenceHelper sharedPreferenceHelper = SharedPreferenceHelper();
  ApiService apiService = ApiService();
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
      body:  FutureBuilder(
        future: apiService.products(), builder: (BuildContext context, AsyncSnapshot<List<Data>?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text("No user data found"));
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: CircleAvatar(child: Text("${snapshot.data![index].id}")),
                title: Text("${snapshot.data![index].name}"),
                subtitle: Text("${snapshot.data![index].category}"),
              );
            },
          );
        }
      },

      ),
    );
  }
}
