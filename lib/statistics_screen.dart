import 'package:flutter/material.dart';
import 'package:flutter_appv2/main.dart';

class StatisticsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Statistics'),
        ),
        body: Text('Success'),
        drawer: MyDrawer(),
    );
  }
}