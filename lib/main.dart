import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appv2/dashboard_screen.dart';
import 'package:flutter_appv2/statistics_screen.dart';
import 'package:flutter_appv2/userlogs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  //
  final String appTitle = 'Flutter Demo'; // app title

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData( // themes
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: appTitle,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: new DefaultDrawer(), // calls the default drawer
        body: new DashboardScreen() // calls the dashboard_screen
    );
  }
}

class DefaultAppBar extends StatelessWidget { // default app bar; referenced throughout the app
  final String screenTitle; // gets title of current screen

  const DefaultAppBar({Key key, this.screenTitle}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(screenTitle), // sets title to screentitle
      centerTitle: true, // centers title
    );
  }
}

class DefaultDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: new ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Drawer Header'), // drawer header title
            decoration: BoxDecoration( // drawer header theme
              color: Colors.blue, 
            ),
          ),
          ListTile(
            title: Text('Dashboard'), // item 1 | dashboard
            onTap: () { // when button is pushed/selected
              Navigator.pop(context);
              Navigator.pushReplacement(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new DashboardScreen()));
            },
          ),
          ListTile(
            title: Text('Statistics'), // item 2 | statistics
            onTap: () { // when button is pushed/selected
              Navigator.pop(context);
              Navigator.pushReplacement(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new StatisticsScreen()));
            },
          ),
          ListTile(
            title: Text('User Logs'), // item 3 | user logs
            onTap: () { // when button is pushed/selected
              Navigator.pop(context);
              Navigator.pushReplacement(context,
                  new MaterialPageRoute(builder: (context) => new UserLogsScreen()));
            },
          ),
        ],
      ),
    );
  }
}
