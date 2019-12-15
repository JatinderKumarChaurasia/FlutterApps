import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:expense_planner/models/transaction.dart';
import 'package:expense_planner/widgets/chartbar.dart';

import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;
  Chart(
    this.recentTransactions,
  );

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(
      7,
      (index) {
        final weekDay = DateTime.now().subtract(
          Duration(days: index),
        );
        double totalSum = 0.0;
        for (var i = 0; i < recentTransactions.length; i++) {
          if (recentTransactions[i].date.day == weekDay.day &&
              recentTransactions[i].date.month == weekDay.month &&
              recentTransactions[i].date.year == weekDay.year) {
            totalSum += recentTransactions[i].amount;
          }
        }
        print('WeekDay : ' + DateFormat.E().format(weekDay).toString());
        print('Total Sum : ' + totalSum.toString());
        return {
          'day': DateFormat.E().format(weekDay).substring(0, 1),
          'amount': totalSum,
        };
      },
    );
  }

  double get totalSpending {
    // 0.0 is the starting value
    return groupedTransactionValues.fold(0.0, (sum, transaction) {
      return sum + transaction['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: groupedTransactionValues.map(
            (transaction) {
              return Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: CharBar(
                  label: transaction['day'],
                  spendingAmount: transaction['amount'],
                  spendingPercentageOfTotal: totalSpending == 0.0
                      ? 0.0
                      : (transaction['amount'] as double) / totalSpending,
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
