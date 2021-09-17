import 'package:flutter/material.dart';
import 'package:wigcity/objects/wigcityuser.dart';

class HomeScreen extends StatefulWidget {
  WigCityUser wigCityUser;

  HomeScreen(this.wigCityUser);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeScreenState();
  }
}


class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.pink,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
      ),
    );
  }
}