import 'package:flutter/material.dart';
import 'package:simple_sqflite_app/dbhelper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SQFlite Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  // reference to our single class that manages the database
  final dbHelper = DatabaseHelper.instance;

  // homepage layout
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sqflite Simple App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text('Insert', style: TextStyle(fontSize: 20, color: Colors.white),),
              padding: EdgeInsets.all(15.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              color: Colors.green,
              onPressed: () {_insert();},
            ),
            SizedBox(
              height: 10.0,
            ),
            RaisedButton(
              child: Text('Query', style: TextStyle(fontSize: 20, color: Colors.white),),
              padding: EdgeInsets.all(15.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              color: Colors.blueAccent,
              onPressed: () {_query();},
            ),
            SizedBox(
              height: 10.0,
            ),
            RaisedButton(
              child: Text('Update', style: TextStyle(fontSize: 20, color: Colors.white),),
              padding: EdgeInsets.all(15.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              color: Colors.orange,
              onPressed: () {_update();},
            ),
            SizedBox(
              height: 10.0,
            ),
            RaisedButton(
              child: Text('Delete', style: TextStyle(fontSize: 20, color: Colors.white),),
              padding: EdgeInsets.all(15.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              color: Colors.red,
              onPressed: () {_delete();},
            ),
          ],
        ),
      ),
    );
  }
  
  // Button onPressed methods
  
  void _insert() async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.columnName : 'I Made Angga Darma Putra',
      DatabaseHelper.columnAge  : 20
    };
    final id = await dbHelper.insert(row);
    print('inserted row id: $id');
  }

  void _query() async {
    final allRows = await dbHelper.queryAllRows();
    print('query all rows:');
    allRows.forEach((row) => print(row));
  }

  void _update() async {
    // row to update
    Map<String, dynamic> row = {
      DatabaseHelper.columnId   : 1,
      DatabaseHelper.columnName : 'Kadek Angga',
      DatabaseHelper.columnAge  : 19
    };
    final rowsAffected = await dbHelper.update(row);
    print('updated $rowsAffected row(s)');
  }

  void _delete() async {
    // Assuming that the number of rows is the id for the last row.
    final id = await dbHelper.queryRowCount();
    final rowsDeleted = await dbHelper.delete(id);
    print('deleted $rowsDeleted row(s): row $id');
  }
}