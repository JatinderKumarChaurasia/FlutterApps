import 'package:flutter/material.dart';

import 'transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'Electricity',
      amount: 134.5,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Food',
      amount: 59.6,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't3',
      title: 'Home Loan',
      amount: 1224.7,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't4',
      title: 'Mobile Bill',
      amount: 277.9,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't5',
      title: 'Other Expenses',
      amount: 34.11,
      date: DateTime.now(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch, // left to right
        mainAxisAlignment: MainAxisAlignment.spaceAround, // top to bottom
        children: <Widget>[
          Container(
            child: Card(
              child: Text('Chart'),
              color: Colors.blue,
              elevation: 5,
            ),
            width: double.infinity,
          ),
          Card(
            color: Colors.green,
            child: Text('List Of Transactions'),
          ),
        ],
      ),
    );
  }
}
