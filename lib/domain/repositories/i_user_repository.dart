import 'package:firebase_auth/firebase_auth.dart';

abstract class IUserRepository {
  Future<bool> logIn({required String email, required String password});
  Future<bool> logOut();
  Future<bool> register({required String email, required String password});
  User? getLoggedUser();
}
