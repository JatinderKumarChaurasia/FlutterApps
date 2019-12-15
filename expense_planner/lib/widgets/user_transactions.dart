import 'dart:math';

import 'package:flutter/material.dart';

import 'package:expense_planner/widgets/transaction_list.dart';
import 'package:expense_planner/widgets/transaction_new.dart';
import 'package:expense_planner/models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'Electricity',
      amount: 34.52,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Food',
      amount: 59.61,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't3',
      title: 'Home Loan',
      amount: 24.75,
      date: DateTime.now(),
    ),
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransactions),
      ],
    );
  }
}
