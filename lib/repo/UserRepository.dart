import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:snap2pay_flutter/model/User.dart';
import 'package:snap2pay_flutter/utils/AppConstants.dart';

class UserRepository {
  final FirebaseAuth _firebaseAuth;
  final Firestore _firestore;

  UserRepository()
      : _firebaseAuth = FirebaseAuth.instance,
        _firestore = Firestore.instance;

  Future<void> signIn(String email, String password) {
    return _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> uploadUserCrendentials(User user) async {
    String id = (await _firebaseAuth.currentUser()).uid;
    return _firestore.collection(USER_PATH).add({id: user});
  }

  Future<FirebaseUser> getCurrentUser() async {
    return await _firebaseAuth.currentUser();
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<bool> isSignedIn() async {
    final currentUser = await _firebaseAuth.currentUser();
    return currentUser != null;
  }
}
