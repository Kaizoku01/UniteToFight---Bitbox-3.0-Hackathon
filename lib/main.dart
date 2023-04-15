import 'package:flutter/material.dart';
import 'package:unitetofight/Screens/HomePage.dart';
import 'package:unitetofight/Screens/InitialRoutingClass.dart';
import 'package:unitetofight/Screens/createProtestPost.dart';
import 'package:unitetofight/Screens/profilePage.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          //primarySwatch: Colors.blue,
          fontFamily: 'Jost',
        ),
        initialRoute: "/",
        routes: {
          "/": (_) => InitialRoutingClass(),
          "/homePage": (BuildContext context) => HomePage(),
          "/createProtest": (BuildContext context) => CreateProtestPost(),
          "/profilePage": (BuildContext context) => ProfilePage(),
        }
    );
  }
}