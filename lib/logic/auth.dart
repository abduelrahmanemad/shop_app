import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthBase{
  User? get currentUser;
  Stream<User?> authStateChanges();
  Future<User?> signInWithEmailAndPassword(String email,String password);
  Future<User?> signUpWithEmailAndPassword(String email,String password);
}
class Auth implements AuthBase{
  final _firebaseAuth=FirebaseAuth.instance;
  @override
  Future<User?> signInWithEmailAndPassword(String email,String password) async {
    final userAuth = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    return userAuth.user;
  }

  @override
  Future<User?> signUpWithEmailAndPassword(String email,String password) async {
    final userAuth = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    return userAuth.user;
  }

  @override
  Stream<User?> authStateChanges() {
    return _firebaseAuth.authStateChanges();
  }

  @override

  User? get currentUser => _firebaseAuth.currentUser;

}