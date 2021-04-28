import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appv2/main.dart';
import 'package:flutter_appv2/statistics_screen.dart';

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
            ),
            MediaCard(),
            MediaCard(),
            MediaCard(),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CategoryCard extends StatelessWidget {
  // TODO: Line Chart implementation
  // TODO: Variable values for Line Chart
  // TODO: Theme and design implementation
  final String cardTitle;

  CategoryCard({Key key, this.cardTitle}) : super(key: key);

  // List<Color> gradientColors = [
  //   const Color(0xff23b6e6),
  //   const Color(0xff02d39a),
  // ];

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shadowColor: Colors.blueGrey,
      child: SizedBox(
          height: 300,
          width: 384.7,
          child: Stack(children: <Widget>[
            Text(cardTitle),
            // LineChart(
            //   LineChartData(
            //     gridData: FlGridData(
            //       show: true,
            //       drawVerticalLine: true,
            //       getDrawingHorizontalLine: (value) {
            //         return FlLine(
            //           color: const Color(0xff37434d),
            //           strokeWidth: 1,
            //         );
            //       },
            //       getDrawingVerticalLine: (value) {
            //         return FlLine(
            //           color: const Color(0xff37434d),
            //           strokeWidth: 1,
            //         );
            //       },
            //     ),
            //     lineBarsData: [
            //       LineChartBarData(
            //         spots: [
            //           FlSpot(0, 3),
            //           FlSpot(2.6, 2),
            //           FlSpot(4.9, 5),
            //           FlSpot(6.8, 3.1),
            //           FlSpot(8, 4),
            //           FlSpot(9.5, 3),
            //           FlSpot(11, 4),
            //         ],
            //         isCurved: true,
            //         colors: gradientColors,
            //         barWidth: 5,
            //         isStrokeCapRound: true,
            //         dotData: FlDotData(
            //           show: false,
            //         ),
            //         belowBarData: BarAreaData(
            //           show: true,
            //           colors: gradientColors
            //               .map((color) => color.withOpacity(0.3))
            //               .toList(),
            //         ),
            //       ),
            //     ],
            //     titlesData: FlTitlesData(
            //         show: false,
            //         bottomTitles: SideTitles(
            //           showTitles: true,
            //           reservedSize: 22,
            //           getTextStyles: (value) => const TextStyle(
            //               color: Color(0xff68737d),
            //               fontWeight: FontWeight.bold,
            //               fontSize: 16),
            //           getTitles: (value) {
            //             switch (value.toInt()) {
            //               case 2:
            //                 return 'MAR';
            //               case 5:
            //                 return 'JUN';
            //               case 8:
            //                 return 'SEP';
            //             }
            //             return '';
            //           },
            //           margin: 8,
            //         ),
            //         leftTitles: SideTitles(
            //           showTitles: false,
            //           getTextStyles: (value) => const TextStyle(
            //             color: Color(0xff67727d),
            //             fontWeight: FontWeight.bold,
            //             fontSize: 15,
            //           ),
            //           getTitles: (value) {
            //             switch (value.toInt()) {
            //               case 1:
            //                 return '10k';
            //               case 3:
            //                 return '30k';
            //               case 5:
            //                 return '50k';
            //             }
            //             return '';
            //           },
            //           reservedSize: 28,
            //           margin: 12,
            //         ),
            //         topTitles: SideTitles(
            //           showTitles: true,
            //           getTextStyles: (value) => const TextStyle(
            //             color: Colors.blue,
            //             fontWeight: FontWeight.bold,
            //             fontSize: 15,
            //           ),
            //         )),
            //   ),
            //   swapAnimationDuration: Duration(milliseconds: 150),
            //   swapAnimationCurve: Curves.linear,
            // ),

            //Text(cardTitle), // Title
          ])),
    );
  }
}
