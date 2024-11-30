import 'package:firebase_auth/firebase_auth.dart';
import 'package:simpleapp/data/datasources/i_user_datasource.dart';
import 'package:simpleapp/domain/models/user.dart';

class UserDataSource extends IUserDataSource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  Future<bool> logIn({required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return true;
    } on FirebaseAuthException catch (e) {
      return false;
    }
  }

  @override
  Future<bool> logOut() async {
    bool loggedOut = true;
    await _firebaseAuth.signOut().onError((error, trace) {
      loggedOut = false;
    });
    return loggedOut;
  }

  @override
  Future<bool> register(
      {required String email, required String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return true;
    } catch (e) {
      return false;
    }
  }
}
