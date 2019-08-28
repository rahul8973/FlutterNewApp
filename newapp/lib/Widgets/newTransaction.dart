import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addtransactionHandler;
  NewTransaction(this.addtransactionHandler);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = new TextEditingController();

  final amountController = new TextEditingController();

  void onSubmittClick() {
    var titleText = titleController.text;
    var amountText = amountController.text.isNotEmpty
        ? double.parse(amountController.text)
        : 0;
    if (titleText.isEmpty || amountText < 0)
      return;

    widget.addtransactionHandler(titleText, amountText);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              //onChanged: (value) {newTitle=value;},
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (val) {
                onSubmittClick();
              },
              //onChanged: (value) {newAmount=value;},
            ),
            FlatButton(
              child: Text('Add new Transaction'),
              textColor: Colors.purple,
              onPressed: () {
                onSubmittClick();
              },
            )
          ],
        ),
      ),
    );
  }
}
