import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter_login/models/user.dart';

class AuthService {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;

  UserAtt? _userFromFirebase(auth.User? user) {
    if (user == null) {
      return null;
    }
    return UserAtt(user.uid,user.email,);
  }

  Stream<UserAtt?> get user {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

  Future<UserAtt?> signInwithEmailAndPassword(
    String email,
    String password,
  ) async {
    
    final credential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    
    return _userFromFirebase(credential.user);
  }

Future<UserAtt?> createwithEmailAndPassword(
  String email,
  String password,
) async {
  if (email.isEmpty || password.isEmpty) {
    print('Email or password cannot be empty');
    return null;
  }

  final credential = await _firebaseAuth.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );
  
  return _userFromFirebase(credential.user);
}


  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }
}
