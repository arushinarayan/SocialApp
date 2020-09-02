import 'package:flutter/material.dart';
import 'package:fru/screens/battle_page.dart';
import 'package:fru/screens/feed_page.dart';
import 'package:fru/screens/profile_page.dart';
import 'package:fru/screens/search_page.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;
  List<Widget> _children = [FeedPage(), SearchPage(), BattlePage(), ProfilePage()];
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex], // new
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new
        backgroundColor:  Colors.white,
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black, size: 25,),
            title: new Text('Home', style: TextStyle(color: Colors.black),),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Colors.black, size: 25,),
            title: new Text('Search', style: TextStyle(color: Colors.black),),
          ),
          new BottomNavigationBarItem(
            icon: Icon(MdiIcons.swordCross, color: Colors.black, size: 25,),
            title: new Text('Battle', style: TextStyle(color: Colors.black),),
          ),
          new BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.black, size: 25,),
              title: new Text('Profile', style: TextStyle(color: Colors.black),)
          )
        ],
      ),

    );
  }
}
