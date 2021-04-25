import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_appv2/main.dart';

class UserLogsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Logs'), centerTitle: true),
      body: new UserLogsTable(), // Create table logs
      drawer: new DefaultDrawer(),
    );
  }
}

class UserLogsTable extends StatelessWidget { // should be stateful if adding queries to table

  static const double _fontSize = 18;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      // dataRowColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states){
      //   if (states.contains(MaterialState.selected))
      //   return Theme.of(context).colorScheme.primary.withOpacity(0.08);
      //   return null;
      // }),
      child: DataTable (
      columns: const <DataColumn>[
        DataColumn(label: Text(
          'User',
          style: TextStyle(fontSize: _fontSize)
        )),

        DataColumn(label: Text(
          'Country',
          style: TextStyle(fontSize: _fontSize)
        )),
        
        DataColumn(label: Text(
          'Payment Method',
          style: TextStyle(fontSize: _fontSize)
        )),
        
        DataColumn(label: Text(
          'Activity',
          style: TextStyle(fontSize: _fontSize)
        ))
      ],
      
      rows: const <DataRow>[ 
        DataRow(cells: <DataCell>[ 
          DataCell(Text('Admin')), // convert placeholders to variables
          DataCell(Text('Philippines')),
          DataCell(Text('American Express')),
          DataCell(Text('5m Ago'))
        ]),

        DataRow(cells: <DataCell>[
          DataCell(Text('Admin')), 
          DataCell(Text('Philippines')),
          DataCell(Text('American Express')),
          DataCell(Text('5m Ago'))
        ])
       // TableRow( // entry # 1
       
       // )
      ],
    )
    );
  }
}

class EntryClass extends StatelessWidget {
  final String userEntry;
  final String countryEntry;
  final String paymentEntry;
  final String activityEntry;

  const EntryClass({Key key, this.userEntry, this.countryEntry, this.paymentEntry, this.activityEntry}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}