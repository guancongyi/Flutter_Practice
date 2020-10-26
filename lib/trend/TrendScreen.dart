import 'package:flutter/material.dart';

class TrendScreen extends StatelessWidget {
  const TrendScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Trend')),
      body: new Center(
        child: Text('Trend'),
      ),
    );
  }
}
