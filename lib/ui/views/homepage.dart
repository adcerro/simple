import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simpleapp/ui/views/login.dart';
import 'package:simpleapp/ui/views/productpage.dart';

import '../controllers/user_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final UserController userController = Get.find();
  final List<Image> images = [
    Image.asset("assets/camera.jpg"),
    Image.asset("assets/camera1.jpg"),
    Image.asset("assets/camera2.jpg"),
    Image.asset("assets/camera3.jpg")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: const Text("Inicio"),
        actions: [
          IconButton(
              onPressed: () async {
                await userController.logOut();
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (build) {
                  return const LoginPage();
                }));
              },
              tooltip: "Cerrar sesión",
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 110,
                flexibleSpace: FlexibleSpaceBar(
                  background: Text(
                    maxLines: 2,
                    "Bienvenido, ${userController.getLoggedUser()?.email}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        overflow: TextOverflow.visible),
                  ),
                ),
              ),
              SliverList.builder(
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.only(top: 2, bottom: 2),
                        child: ListTile(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return ProductPage(
                                  product: "Item $index",
                                  photo: images[index % images.length]);
                            }));
                          },
                          minTileHeight: 60,
                          leading: SizedBox(
                              width: 80, child: images[index % images.length]),
                          title: Text("Item $index"),
                          tileColor: Theme.of(context).splashColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ));
                  }),
            ],
          )),
    );
  }
}
