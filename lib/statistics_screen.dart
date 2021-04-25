import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appv2/main.dart';

class StatisticsScreen extends StatelessWidget {
  // TODO: Theme and design implementation
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Statistics'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MainStatChart(), 
            StatCardHolder(),
            MediaCard(), 
            MediaCard(), 
            MediaCard()
            ],
        ),
      ),
      drawer: DefaultDrawer(),
    );
  }
}

class MainStatChart extends StatelessWidget {
  // TODO: Chart implementation 
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: 
      SizedBox(
        height: 400,
        child: Text('Chart Here'), //LineChart
        ),
    );
  }
}

// ignore: must_be_immutable
class StatCardHolder extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        
        children: [
          Row(
            children: [
              StatCard(
                chartTitle: ('Visits'),
              ),
              StatCard(
                chartTitle: ('New Users'),
              )
            ],
          ),
          Row(
            children: [
              StatCard(
                chartTitle: ('Pageviews'),
              ),
              StatCard(
                chartTitle: ('Bounce Rate'),
              )
            ],
          )
        ]
      ),
    );
  }
}

// ignore: must_be_immutable
class StatCard extends StatelessWidget {
  // TODO: Circular progress bar implementation 
  // TODO: Add variable for values of progress bar
  final double elevationVar = 2;
  final double cardWidth = 188;
  final double cardHeight = 200;

  final String chartTitle;

  const StatCard({Key key, this.chartTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevationVar,
      child: SizedBox(
        height: cardHeight, width: cardWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(('Chart here')), // RoundChart Implementation here
            Text(chartTitle)
          ],
        ),
      ),
    );
  }
}

class MediaCard extends StatelessWidget {
  final Image mediaIcon;

  final int value1;
  final String value1Title;

  final int value2;
  final String value2Title;

  const MediaCard(
      {Key key,
      this.value1,
      this.value1Title,
      this.value2,
      this.value2Title,
      this.mediaIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 2,
        child: SizedBox(
          height: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.favorite, color: Colors.black, size: 26.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                      'Media Title'), // change to a column (value0, value0Title)
                  Container(
                      height: 80, child: VerticalDivider(color: Colors.black)),
                  Text(
                      'Media Title') // change to a column (value0, value0Title)
                ],
              )
            ],
          ),
        ));
  }
}
