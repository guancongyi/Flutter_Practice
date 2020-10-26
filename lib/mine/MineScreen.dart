import 'package:flutter/material.dart';

class MineScreen extends StatelessWidget {
  const MineScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: new Center(
        child: Text('Mine Profile'),
      ),
    );
  }
}
