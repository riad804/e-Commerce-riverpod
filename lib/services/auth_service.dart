import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static const USERS = "users";

  Future<String?> signup({
    required String name,
    required String email,
    required String password,
    required String role,
  }) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      await _firestore.collection(USERS).doc(userCredential.user!.uid).set({
        'name': name.trim(),
        'email': email.trim(),
        'role': role.trim(),
      });
      return null;
    } catch (e) {
      return e.toString();
    }
  }

  Future<String?> login({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      final DocumentSnapshot userDoc =
          await _firestore
              .collection(USERS)
              .doc(userCredential.user!.uid)
              .get();

      return userDoc['role'];
    } catch (e) {
      return e.toString();
    }
  }
}
