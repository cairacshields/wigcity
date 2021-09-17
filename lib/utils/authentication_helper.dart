import 'package:firebase_auth/firebase_auth.dart';
import 'package:wigcity/objects/wigcityuser.dart';

import 'database_helper.dart';


class AuthenticationHelper {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();



  Future<WigCityUser?> signIn(String email, String password) async {
    try {
      return await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password)
      .then((value) async {
        if (value.user != null) {
          return await _databaseHelper.getUserById(value.user!.uid)
          .then((value) {
            return value;
          }).catchError((error) {
            print ("Error getting signed in user from DB: ${error}");
          });

        } else return null;

      }).catchError((error) {
        print("Error signing user in with email and password: ${error}");
        return null;
      });

    } on FirebaseAuthException catch(e) {
      print("Error signing user in with email and password: ${e.message}");
      return null;
    }
  }

  Future<WigCityUser?> signUp(String email, String password) async {
    try {
      return await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password)
      .then((value) async {
        //we should add the new user to DB...

        if (value.user != null) {
          WigCityUser wigCityUser = WigCityUser(value.user!.uid, email);

          await _databaseHelper.addUser(wigCityUser);

          return wigCityUser;
        } else {
          return null;
        }

      }).catchError((error) {
        print("Error creating user with email and password: ${error}");
      });

    } on FirebaseAuthException catch(e) {
      print("Error creating user with email and password: ${e.message}");
      return null;
    }
  }

  // 5
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } on FirebaseAuthException catch(e) {
      print("Error signing user out: ${e.message}");
    }
  }

  User? getUser() {
    try {
      return _firebaseAuth.currentUser;
    } on FirebaseAuthException {
      return null;
    }
  }
}