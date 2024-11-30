import '../../../domain/models/user.dart';

abstract class IUserDataSource {
  Future<bool> logIn({required String email, required String password});
  Future<bool> logOut();
  Future<bool> register({required String email, required String password});
}
