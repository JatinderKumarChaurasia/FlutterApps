import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function _newTransactionHandler;
  NewTransaction(this._newTransactionHandler);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submitData() {
    final inputtedTitle = titleController.text;
    final inputtedAmount = double.parse(amountController.text);
    if (inputtedTitle.isEmpty || inputtedAmount <= 0) {
      return;
    }
//     Through widget we can access the methods and properties of NewTransaction class
    widget._newTransactionHandler(
      inputtedTitle,
      inputtedAmount,
    );
    // Close the Bottom Sheet
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              enableInteractiveSelection: true,
              textCapitalization: TextCapitalization.sentences,
              dragStartBehavior: DragStartBehavior.start,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.title,
                  color: Colors.blue,
                ),
                labelText: 'Title',
                hasFloatingPlaceholder: true,
                labelStyle: TextStyle(
                    color: Colors.lightBlue, fontWeight: FontWeight.bold),
              ),
              controller: titleController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.attach_money,
                  color: Colors.blue,
                ),
                labelText: 'Amount',
                labelStyle: TextStyle(
                  color: Colors.lightBlue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              dragStartBehavior: DragStartBehavior.start,
              enableInteractiveSelection: true,
              controller: amountController,
              textCapitalization: TextCapitalization.sentences,
              onSubmitted: (_) => submitData(),
            ),
            FlatButton(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                splashColor: Colors.amber,
                hoverColor: Colors.blue,
                child: Text(
                  'Add Transaction',
//                textAlign: TextAlign.right,
                ),
                textColor: Colors.purple,
                onPressed: submitData),
          ],
        ),
      ),
    );
  }
}
