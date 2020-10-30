import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String title;
  DetailScreen(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(this.title)),
    );
  }
}
