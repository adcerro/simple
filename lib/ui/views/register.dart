import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/user_controller.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final UserController userController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).splashColor,
      body: SingleChildScrollView(
          padding: EdgeInsets.only(top: MediaQuery.sizeOf(context).height / 4),
          child: Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Icon(
                      Icons.add_reaction,
                      color: Theme.of(context).primaryColor,
                      size: MediaQuery.sizeOf(context).width / 3,
                    ),
                    TextFormField(
                        controller: _email,
                        decoration: const InputDecoration(labelText: "Email"),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingrese correo';
                          }
                          return null;
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                        controller: _password,
                        decoration:
                            const InputDecoration(labelText: "Contraseña"),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingrese contraseña';
                          }
                          if (value.length < 6) {
                            return 'Contraseña muy corta';
                          }
                          return null;
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                    TextButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            if (await userController.register(
                                email: _email.text, password: _password.text)) {
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      backgroundColor: Colors.red,
                                      content: Text("Revisar credenciales")));
                            }
                          }
                        },
                        style: ButtonStyle(
                            shape: WidgetStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5))),
                            minimumSize: const WidgetStatePropertyAll(
                                Size.fromHeight(45)),
                            foregroundColor: WidgetStatePropertyAll(
                                Theme.of(context).colorScheme.onPrimary),
                            backgroundColor: WidgetStatePropertyAll(
                                Theme.of(context).primaryColor)),
                        child: const Text("Registrarse"))
                  ],
                )),
          )),
    );
  }
}
