import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final String product;
  const ProductPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          title: const Text("Producto"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("assets/camera.jpg"),
              Text(
                product,
                style: Theme.of(context).textTheme.titleLarge,
              )
            ],
          ),
        ));
  }
}
