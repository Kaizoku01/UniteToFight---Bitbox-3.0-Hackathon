import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:unitetofight/Screens/profilePage.dart';

import 'package:unitetofight/globalConstants.dart' as global;

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Size size;
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
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
      appBar: AppBar(
        elevation: 0,
        title: Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Icon(Icons.location_pin),
            ),
            Text('location_here'),
          ],
        ),
        backgroundColor: Color(0xff017E91),
      ),
      backgroundColor: Color(0xffF6EBD5),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ProtestCard(),
              ProtestCard(),
            ],
          ),
        ),
      ),
    );
  }
}

class ProtestCard extends StatelessWidget {
  const ProtestCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/images/rasie.jpg'),
              ),
              title: Text('Forest Cutting in Sector 128 Park'),
              subtitle: Text(
                'by Sarvagya Saxena',
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Greyhound divisively hello coldly wonderfully marginally far upon excluding.Greyhound divisively hello coldly wonderfully marginally far upon excluding.',
                style: TextStyle(color: Colors.black.withOpacity(0.6)),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Image.asset('assets/images/rasie.jpg'),

            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '950' + ' Supporters',
                    style: TextStyle(
                        fontFamily: 'Jost',
                        fontStyle: FontStyle.italic,
                        color: Colors.red),
                  ),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(FontAwesomeIcons.heart),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.share),
                ),
              ],
            ),
          ],
        ),
      ),
      onTap: (){

      },
    );
  }
}


class ProtestCardExtend extends StatelessWidget {
  const ProtestCardExtend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
