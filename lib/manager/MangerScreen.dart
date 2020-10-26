import 'package:flutter/material.dart';

class ManagerScreen extends StatelessWidget {
  const ManagerScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Manage')),
      body: new Center(
        child: Text('Manage'),
      ),
    );
  }
}
