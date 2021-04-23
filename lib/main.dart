import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appv2/statistics_screen.dart';
import 'package:flutter_appv2/userlogs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  //
  final appTitle = 'Flutter Demo';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
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
        appBar: AppBar(
          title: Text('Dashboard'),
          centerTitle: true,
        ),
        drawer: new MyDrawer(),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CategoryCard(
                cardTitle: 'Category 1',
              ),
              CategoryCard(
                cardTitle: 'Category 2',
              ), // Category 2
              CategoryCard(
                cardTitle: 'Category 3',
              ),
              CategoryCard(
                // Category 4
                cardTitle: 'Category 4',
              )
            ],
          ),
        ));
  }
}

// ignore: must_be_immutable
class CategoryCard extends StatelessWidget {
  final String cardTitle;

  const CategoryCard({Key key, this.cardTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shadowColor: Colors.blueGrey,
      child: SizedBox(
          height: 300,
          child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            ListTile(
                //leading: LineChart(
                  //LineChartData(
                    //Chart here
                  //)
                  //), 
                  title: Text(cardTitle)
                )
          ])),
    );
  }
}

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: new ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Drawer Header'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Dashboard'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new MyHomePage()));
            },
          ),
          ListTile(
            title: Text('Statistics'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new StatisticsScreen()));
            },
          ),
          ListTile(
            title: Text('User Logs'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(context,
                  new MaterialPageRoute(builder: (context) => new UserLogs()));
            },
          ),
        ],
      ),
    );
  }
}

// class FirstRoute extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('First Route'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           child: Text('Open route'),
//           onPressed: () {
//             // Navigate to second route when tapped.
//           },
//         ),
//       ),
//     );
//   }
// }

// class SecondRoute extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Second Route"),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             // Navigate back to first route when tapped.
//           },
//           child: Text('Go back!'),
//         ),
//       ),
//     );
//   }
// }
