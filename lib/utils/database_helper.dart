import 'package:firebase_database/firebase_database.dart';
import 'package:wigcity/objects/wigcityuser.dart';

class DatabaseHelper {

  final DatabaseReference _usersRef = FirebaseDatabase.instance.reference().child('users');
  final DatabaseReference _wigsRef = FirebaseDatabase.instance.reference().child('wigs');

  //Add user to DB
  Future<void> addUser(WigCityUser user) async {
    await _usersRef.child(user.id).set(user.toJson());
  }

  //Get certain user by ID
  Future<WigCityUser> getUserById(String id) async {
    return await _usersRef.child(id).once()
        .then((user){
       return WigCityUser.fromJson(user.value);
    }).catchError((error) {
      print("Error getting user by ID: ${error}");
      return null;
    });
  }

  //Get all wigs

}