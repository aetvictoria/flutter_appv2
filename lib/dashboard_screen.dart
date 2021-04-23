import 'package:flutter/material.dart';
import 'package:flutter_appv2/main.dart';

class DashboardScreen extends StatelessWidget {
  final String _screenTitle = 'Dashboard';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_screenTitle), centerTitle: true),
      drawer: new DefaultDrawer(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CategoryCard(
              cardTitle: 'Category 1',
            ),
            CategoryCard(
              cardTitle: 'Category 2',
            ),
            CategoryCard(
              cardTitle: 'Category 3',
            ),
            CategoryCard(
              cardTitle: 'Category 4',
            )
          ],
        ),
      ),
    );
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
                title: Text(cardTitle))
          ])),
    );
  }
}
