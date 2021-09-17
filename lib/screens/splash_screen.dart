import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wigcity/utils/database_helper.dart';

import 'home_screen.dart';
import 'login_screen.dart';


class SplashScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SplashScreenState();
  }

}

class _SplashScreenState extends State<SplashScreen> {
  DatabaseHelper _databaseHelper = DatabaseHelper();


  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 5000), () async {

      if (FirebaseAuth.instance
          .currentUser == null) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
              settings: const RouteSettings(name: 'LoginScreen'),
            ));
      } else {
        //TODO ~ Get the user from DB and pass to home screen
        await _databaseHelper.getUserById(FirebaseAuth.instance.currentUser!.uid)
            .then((value) async {
            //Bring to home screen
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomeScreen(value),
                  settings: const RouteSettings(name: 'HomeScreen'),
                ));

        }).catchError((error){
          print("Error retrieving user from database: $error");
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
                alignment: AlignmentDirectional.center,
                margin: EdgeInsets.only(top: 20.0),
                child: Image.asset(
                  'assets/images/wigcity_base_icon.png',
                  height: 200.0,
                  width: 150.0,
                ),
              ),
            )
    );
  }
}