import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:unitetofight/Screens/HomePage.dart';
import 'package:unitetofight/Screens/createProtestPost.dart';
import 'package:unitetofight/Screens/profilePage.dart';
import 'package:unitetofight/globalConstants.dart' as global;
class InitialRoutingClass extends StatefulWidget {
  const InitialRoutingClass({Key? key}) : super(key: key);

  @override
  State<InitialRoutingClass> createState() => _InitialRoutingClassState();
}

class _InitialRoutingClassState extends State<InitialRoutingClass> {
  late Size size;
  int _selectedIndex = 0;

  static List<Widget> _screens = <Widget>[
    HomePage(),
    CreateProtestPost(),
    ProfilePage(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    global.deviceHeight = size.height;
    global.deviceWidth = size.width;

    return Scaffold(
      backgroundColor: Color(0xffF6EBD5),
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.textIn,
        backgroundColor: Color(0xff017E91),
        items: [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.add, title: 'Add'),
          TabItem(icon: Icons.person_2_rounded, title: 'Profile'),
        ],
        initialActiveIndex: _selectedIndex,
        //selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
      body: _screens[_selectedIndex],
    );
  }
}
