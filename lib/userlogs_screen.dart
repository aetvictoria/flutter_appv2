
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_appv2/main.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class UserLogsScreen extends StatefulWidget {
  UserLogsScreen({Key key}) : super(key: key);

  @override
  _UserLogsScreenState createState() => _UserLogsScreenState();
}

class _UserLogsScreenState extends State<UserLogsScreen> {

  Future<EntryList> futureEntry;

  @override
  void initState() {
    super.initState();
    futureEntry = fetchEntry() as Future<EntryList>;
  }

  

  @override
  Widget build(BuildContext context) {
    //TODO: Fix "type 'List<dynamic>' is not a unique subtype of type 'Map<String,dynamic>'"
    return Scaffold(
      appBar: AppBar(title: Text('User Logs'), centerTitle: true),
      //body: new UserLogsTable(), // Create table logs
      body: Center(
          child: FutureBuilder<EntryList>(
            future: futureEntry,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text('${snapshot.data}');
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
      ),

      drawer: new DefaultDrawer(),
    );
  }
}

class UserLogsTable extends StatelessWidget {
  // should be stateful if adding queries to table

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
        child: DataTable(
          // TODO: Create as separate stateful widget
          // TODO: Adjust table size to disable horizontal scroll view
          columns: const <DataColumn>[
            DataColumn(
                label: Text('User', style: TextStyle(fontSize: _fontSize))),
            DataColumn(
                label: Text('Country', style: TextStyle(fontSize: _fontSize))),
            DataColumn(
                label: Text('Payment Method',
                    style: TextStyle(fontSize: _fontSize))),
            DataColumn(
                label: Text('Activity', style: TextStyle(fontSize: _fontSize)))
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
              DataCell(Text('1h Ago'))
            ])
            // TableRow( // entry # 1

            // )
          ],
        ));
  }
}

class Entry {
  final String department_id;
  final String department_name;

Entry({@required this.department_id, @required this.department_name});

factory Entry.fromJson(Map<String, dynamic> json){
  return new Entry(
    department_id: json['id'].toString(),
    department_name: json['department_name'].toString(),
  );
}

}

class EntryList{
  final List<Entry> entries;


  EntryList({
    this.entries
  });

  factory EntryList.fromJson(List<dynamic> json){

  List<Entry> entries = new List<Entry>();

  entries = json.map((i) => Entry.fromJson(i)).toList();

  return EntryList(
    entries: entries,
    //department_id : json['id'].toString(),
    //department_name : json['department_name'].toString()
  );

}
}


Future<EntryList> fetchEntry() async {
    final response =
    await http.get(Uri.https("ais.amti.com.ph", "/OpenApi/departments"));
  
    if (response.statusCode == 200) {
      print(EntryList.fromJson(jsonDecode(response.body)));
      
    } else {
      throw Exception('Failed to load');
    }
  
  }

