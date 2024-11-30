import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  final String product;
  const ProductPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(product),
          )
        ],
      ),
    );
  }
}
