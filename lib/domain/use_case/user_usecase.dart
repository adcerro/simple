import 'package:simpleapp/domain/repositories/i_user_repository.dart';

class UserUseCase {
  final IUserRepository _repository;
  UserUseCase(this._repository);
  Future<bool> logIn({required String email, required String password}) =>
      _repository.logIn(email: email, password: password);
  Future<bool> logOut() => _repository.logOut();
  Future<bool> register({required String email, required String password}) =>
      _repository.register(email: email, password: password);
}
