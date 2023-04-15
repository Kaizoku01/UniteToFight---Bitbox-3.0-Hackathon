import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:unitetofight/globalConstants.dart' as global;

import 'HomePage.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with TickerProviderStateMixin{
  late TabController _tabController;
  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff017E91),
        title: Text('Profile Details'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile.jpg'),
              radius: 60,
            ),
            Text('Sarvagya Saxena',style: TextStyle(fontSize: 20),),
            TabBar(
              controller: _tabController,
              //isScrollable: true,
              tabs: [
                Tab(
                  child: Text('My Posts',style: TextStyle(color: Colors.black),),
                ),
                Tab(
                  child: Text('I signed up',style: TextStyle(color: Colors.black),),
                ),
              ],
            ),
            Container(
              height: 500,
              width: double.infinity,
              child: TabBarView(
                controller: _tabController,
                  children: [
                Column(
                  children: [
                    ProtestCard(),
                  ],
                ),
                    Column(
                      children: [
                        ProtestCard(),
                      ],
                    )
              ]),
            ),
            // ListView.builder(itemBuilder: (BuildContext context, int index){
            //   return Card(
            //     child: Text('Hello'),
            //   );
            // })
          ],
        ),
      ),
    );
  }
}

class CommentBox extends StatelessWidget {
  const CommentBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
