import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simpleapp/data/datasources/i_user_datasource.dart';
import 'package:simpleapp/domain/repositories/i_user_repository.dart';
import 'package:simpleapp/ui/controllers/user_controller.dart';
import 'package:simpleapp/ui/views/login.dart';
import 'data/datasources/user_datasource.dart';
import 'data/repositories/user_repository.dart';
import 'domain/use_case/user_usecase.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put<IUserDataSource>(UserDataSource());
  Get.put<IUserRepository>(UserRepository(Get.find()));
  Get.put(UserUseCase(Get.find()));
  Get.put(UserController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
          useMaterial3: true,
        ),
        home: const LoginPage());
  }
}
