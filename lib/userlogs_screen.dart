import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_appv2/main.dart';

import 'package:http/http.dart' as http;

class UserLogsScreen extends StatefulWidget {
  UserLogsScreen({Key key}) : super(key: key);

  @override
  _UserLogsScreenState createState() => _UserLogsScreenState();
}

class _UserLogsScreenState extends State<UserLogsScreen> {
  Future<Entry> futureEntry;

  @override
  void initState() {
    super.initState();
    futureEntry = fetchEntry();
  }

  @override
  Widget build(BuildContext context) {//TODO: Fix "type 'List<dynamic>' is not a unique subtype of type 'Map<String,dynamic>'"
    return Scaffold(
      appBar: AppBar(title: Text('User Logs'), centerTitle: true),
      //body: new UserLogsTable(), // Create table logs
      body: FutureBuilder<Entry>(
            future: futureEntry,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.departmentName);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
      ),
      drawer: new DefaultDrawer(),
    );
  }
}

List<Entry> parseEntry(String responseBody) { //converts response to List<String>
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Entry>((json) => Entry.fromJson(json)).toList();
}

Future<List<Entry>> fetchEntry(http.Client client) async {
  final response =
      await client .get(Uri.parse('https://ais.amti.com.ph/OpenApi/departments'));

return parseEntry(response.body);

  // if (response.statusCode == 200) {
  //   //if server access successful:
  //   return Entry.fromJson(jsonDecode(response.body)); //parse
  // } else {
  //   //if server access unsuccessful:
  //   throw Exception('Failed to load album'); //throw exception
  // }
}

Future<Entry> fetchEntry() async {
  final response = await http.get(Uri.https('ais.amti.com.ph', '/OpenApi/departments'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Entry.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Entry { // Class for Json Entries
  String id;
  String departmentName;

  Entry({this.id, this.departmentName});

  factory Entry.fromJson(Map<String, dynamic> json) {
    return new Entry(
      id: json['id'].toString(),
      departmentName: json['department_name']
    );
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['department_name'] = this.departmentName;
  //   return data;
  // }
}

class EntriesList {
  List<Entry> entries;

    EntriesList({
      this.entries
    });

    factory EntriesList.fromJson(List<dynamic> parsedJson) {

    List<Entry> entries = new List<Entry>();

    return new EntriesList(
       entries: entries,
    );
  }
}

// factory EntryList.fromJson(List<dynamic> parsedJson){
//   List<Entry> entries = new List<Entry>();

//   entries = parsedJson.map((i)=>Entry.fromJson(i)).toList();


//   return new Entry(
//     entries: entries,
//   );
// } 

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

class EntryClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
