import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _user = TextEditingController();
  final _password = TextEditingController();

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
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Icon(
                  Icons.add_reaction,
                  color: Theme.of(context).primaryColor,
                  size: MediaQuery.sizeOf(context).width / 3,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: "Email"),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: "Contraseña"),
                  obscureText: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                        minimumSize:
                            const WidgetStatePropertyAll(Size.fromHeight(45)),
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
