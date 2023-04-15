import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:unitetofight/Screens/createProtestPost.dart';
import 'package:unitetofight/Screens/profilePage.dart';

import 'package:unitetofight/globalConstants.dart' as global;

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Size size;

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled:true,
              builder: (BuildContext context){
            return CreateProtestPost();
          });
        },
        child: Icon(
          FontAwesomeIcons.plus,
        ),
        backgroundColor: Color(0xff017E91),
      ),
    );
  }
}

class ProtestCard extends StatefulWidget {
  ProtestCard({Key? key}) : super(key: key);

  @override
  State<ProtestCard> createState() => _ProtestCardState();
}

class _ProtestCardState extends State<ProtestCard> {
  bool _isLiked = false;

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
                  onPressed: () {
                    setState(() {
                      _isLiked = !_isLiked;
                    });
                  },
                  icon: _isLiked? Icon(FontAwesomeIcons.solidHeart,color: Colors.redAccent,) : Icon(FontAwesomeIcons.heart) ,
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
      onTap: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            fullscreenDialog: true,
            builder: (context) => ProtestCardExtend(),
          ),
        );
      },
    );
  }
}

class ProtestCardExtend extends StatefulWidget {
  ProtestCardExtend({Key? key}) : super(key: key);
  @override
  State<ProtestCardExtend> createState() => _ProtestCardExtendState();
}

class _ProtestCardExtendState extends State<ProtestCardExtend> {
  bool isSupport = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Forest Cutting in Sector 128 Park',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Image.asset('assets/images/rasie.jpg'),
                  ),
                  //SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 5),
                    child: RichText(
                      text: TextSpan(
                        text: 'This protest is created by ',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Jost',
                            fontSize: 20),
                        children: [
                          TextSpan(
                            text: 'Sarvagya Saxena' + ',',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                decoration: TextDecoration.underline,
                                color: Colors.blueAccent),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Text(
                        '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                      ''',
                        style: TextStyle(fontSize: 15)),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  //   child: Align(
                  //     alignment: Alignment.bottomLeft,
                  //     child: Text(
                  //       'Information :',
                  //       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: RichText(
                      text: TextSpan(
                        text: 'Protest Date : ',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Jost',
                          fontSize: 17,
                        ),
                        children: [
                          TextSpan(
                            text: '15th April 2023',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '950' + ' Supporters',
                          style: TextStyle(
                            fontFamily: 'Jost',
                            fontStyle: FontStyle.italic,
                            color: Colors.red,
                            fontSize: 17,
                          ),
                        ),
                        IconButton(icon: Icon(Icons.share), onPressed: (){},),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Divider(),
          InkWell(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              height: global.deviceHeight / 14,
              width: global.deviceWidth / 1.3,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  //border: Border.all(color: Colors.black, width: 1.5),
                  color: isSupport ? Color(0xffBFE7ED) : Color(0xff17D4EE),
                  boxShadow: [BoxShadow(blurRadius: 4)]),
              child: Center(
                child: Text(
                  isSupport ? 'Out' : 'In',
                  style: TextStyle(
                      fontFamily: 'Jost',
                      fontWeight: FontWeight.bold,
                      fontSize: 26),
                ),
              ),
            ),
            onTap: () {
              setState(() {
                isSupport = !isSupport;
              });
            },
          ),
        ],
      ),
    );
  }
}
