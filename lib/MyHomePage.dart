import 'package:flutter/material.dart';
import 'package:flutter_app/discover/discoverScreen.dart';
import 'package:flutter_app/manager/mangerScreen.dart';
import 'package:flutter_app/mine/mineScreen.dart';
import 'package:flutter_app/trend/trendScreen.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Widget> _children = [
    DiscoverScreen(),
    TrendScreen(),
    ManagerScreen(),
    MineScreen(),
  ];

  int _currentIndex = 0;

  void onTabTapped(int selectedIndex) {
    setState(() {
      _currentIndex = selectedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: new BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.blue,
        selectedFontSize: 12,
        showUnselectedLabels: true,
        items: [
          new BottomNavigationBarItem(
              icon: Icon(Icons.search), label: 'Discover'),
          new BottomNavigationBarItem(
              icon: Icon(Icons.arrow_circle_up), label: 'Trend'),
          new BottomNavigationBarItem(
              icon: Icon(Icons.account_balance), label: 'Manage'),
          new BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Mine'),
        ],
      ),
    );
  }
}
