import 'dart:math';

import 'package:expense_planner/widgets/chart.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:expense_planner/widgets/transaction_list.dart';
import 'package:expense_planner/widgets/transaction_new.dart';

import 'models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ExpenseApp',
      home: _MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.amber,
        fontFamily: 'Comfortaa',
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                  fontFamily: 'Muli',
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class _MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  final List<Transaction> _userTransactions = [
//    Transaction(
//      id: 't1',
//      title: 'Electricity',
//      amount: 34.52,
//      date: DateTime.now(),
//    ),
//    Transaction(
//      id: 't2',
//      title: 'Food',
//      amount: 59.61,
//      date: DateTime.now(),
//    ),
//    Transaction(
//      id: 't3',
//      title: 'Home Loan',
//      amount: 24.75,
//      date: DateTime.now(),
//    ),
//    Transaction(
//      id: 't4',
//      title: 'Mobile Bill',
//      amount: 77.94,
//      date: DateTime.now(),
//    ),
//    Transaction(
//      id: 't5',
//      title: 'Other Expenses',
//      amount: 34.11,
//      date: DateTime.now(),
//    ),
  ];

  void _addNewTransaction(String title, double amount) {
    final Transaction transaction = new Transaction(
      id: Random(4).toString(),
      title: title,
      amount: amount,
      date: DateTime.now(),
    );
    setState(() {
      _userTransactions.add(transaction);
    });
  }

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((transaction) {
      return transaction.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _openAddNewTransactionSlice(BuildContext buildContext) {
    showModalBottomSheet(
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(29)),
        context: buildContext,
        builder: (builderContext) {
          return GestureDetector(
            child: NewTransaction(_addNewTransaction),
            onTap: () {},
            behavior: HitTestBehavior.opaque,
            dragStartBehavior: DragStartBehavior.start,
          );
        },
        clipBehavior: Clip.antiAliasWithSaveLayer);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Expense App',
          style: TextStyle(
              color: Theme.of(context).appBarTheme.color,
              fontSize: 20,
              fontFamily: 'Muli'),
          textAlign: TextAlign.center,
        ),
//        backgroundColor: Colors.white,
        centerTitle: true,
        leading: Icon(
          Icons.ac_unit,
          color: Theme.of(context).buttonColor,
          size: 30,
          semanticLabel: 'Icon',
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
//              color: Theme.of(context).iconTheme.color,
              size: 30,
            ),
            splashColor: Theme.of(context).splashColor,
            hoverColor: Theme.of(context).hoverColor,
            highlightColor: Theme.of(context).highlightColor,
            padding: EdgeInsets.all(4),
            tooltip: 'Add',
            onPressed: () => _openAddNewTransactionSlice(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch, // left to right
          //  mainAxisAlignment: MainAxisAlignment.start, // top to bottom // start is default
          children: <Widget>[
            Chart(_recentTransactions),
            TransactionList(_userTransactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(
          Icons.add,
          color: Theme.of(context).primaryColor,
        ),
        label: Text(
          'Add',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
//        backgroundColor: Theme.of(context).dialogBackgroundColor,
        splashColor: Theme.of(context).splashColor,
        onPressed: () => _openAddNewTransactionSlice(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
