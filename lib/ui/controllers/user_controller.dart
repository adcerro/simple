import '../../domain/use_case/user_usecase.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final UserUseCase userUseCase = Get.find();
  Future<bool> logIn({required String email, required String password}) =>
      userUseCase.logIn(email: email, password: password);
  Future<bool> logOut() => userUseCase.logOut();
  Future<bool> register({required String email, required String password}) =>
      userUseCase.register(email: email, password: password);
}
