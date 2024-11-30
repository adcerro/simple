import 'package:firebase_auth/firebase_auth.dart';
import 'package:simpleapp/data/datasources/i_user_datasource.dart';
import 'package:simpleapp/domain/repositories/i_user_repository.dart';

class UserRepository extends IUserRepository {
  final IUserDataSource _userDataSource;
  UserRepository(this._userDataSource);
  @override
  Future<bool> logIn({required String email, required String password}) =>
      _userDataSource.logIn(email: email, password: password);

  @override
  Future<bool> logOut() => _userDataSource.logOut();

  @override
  Future<bool> register({required String email, required String password}) =>
      _userDataSource.register(email: email, password: password);

  @override
  User? getLoggedUser() {
    return _userDataSource.getLoggedUser();
  }
}
