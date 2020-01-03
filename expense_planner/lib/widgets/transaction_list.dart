import 'package:flutter/material.dart';

import 'package:expense_planner/models/transaction.dart';

import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No Transactions Added Yet !!',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 400,
                  margin: EdgeInsets.all(20),
                  child: Image.asset(
                    'assets/images/image1.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.amber,
                  radius: 30,
                  child: Text('\$${transactions[index].amount}'),
                ),
              );
            }),
    );
  }
}
//
//return Card(
//margin: EdgeInsets.all(5.0),
//shape: RoundedRectangleBorder(
//borderRadius: BorderRadius.all(
//Radius.circular(10),
//),
//),
//child: Row(
//children: <Widget>[
//Container(
//margin: EdgeInsets.symmetric(
//vertical: 15,
//horizontal: 15,
//),
//padding: EdgeInsets.all(10),
//decoration: BoxDecoration(
//border: Border.all(
//color: Theme.of(context).primaryColor,
//width: 2.0,
//),
//),
//child: Text(
//'\$${transactions[index].amount.toStringAsFixed(2)}',
//style: TextStyle(
//fontWeight: FontWeight.bold,
//fontSize: 20,
//color: Theme.of(context).primaryColorDark),
//),
//),
//Column(
//crossAxisAlignment: CrossAxisAlignment.start,
//children: <Widget>[
//Text(transactions[index].title,
//style: Theme.of(context).textTheme.title),
//Text(
//DateFormat.yMMMd().format(
//transactions[index].date,
//),
//style: TextStyle(
//color: Colors.grey,
//),
//),
//],
//),
//],
//),
//);
//},
//itemCount: transactions.length,
//physics: BouncingScrollPhysics(),
////          children: transactions.map(
////            (transaction) {
////
////            },
////          ).toList(),
