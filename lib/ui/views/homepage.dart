import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simpleapp/ui/views/login.dart';

import '../controllers/user_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _LoginPageState();
}

class _LoginPageState extends State<HomePage> {
  UserController userController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("Inicio"),
        actions: [
          IconButton(
              onPressed: () {
                userController.logOut();
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (build) {
                  return LoginPage();
                }));
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Column(
        children: [
          Text("Bienvenido, ${userController.getLoggedUser()?.email}")
        ],
      ),
    );
  }
}
