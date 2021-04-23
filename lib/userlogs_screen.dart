import 'package:flutter/material.dart';
import 'package:flutter_appv2/main.dart';

class UserLogs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Logs'),
        centerTitle: true,
        ),
        body: Text('Success'), // Create table logs
        drawer: MyDrawer(),
    );
  }
}