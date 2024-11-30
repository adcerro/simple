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
              ),
              const Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam mollis nibh id nisl semper bibendum a sit amet sem. Fusce sit amet nibh semper neque accumsan vehicula at non eros. Fusce id sem felis. Vestibulum purus massa, ornare sed purus non, ultricies dapibus orci. Sed ullamcorper facilisis pretium. Integer eros sem, facilisis ut fermentum vitae, mattis sed diam. Proin nec erat leo. In hac habitasse platea dictumst. Integer accumsan nunc nisi.")
            ],
          ),
        ));
  }
}
