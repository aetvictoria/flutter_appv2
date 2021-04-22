import 'package:flutter/material.dart';
import 'package:flutter_appv2/main.dart';

class UserLogs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Logs'),
        ),
        body: Text('Success'),
        drawer: MyDrawer(),
    );
  }
}