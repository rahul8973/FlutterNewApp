import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newapp/Model/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _userTransactions;
  TransactionList(this._userTransactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
            child: Row(
              children: <Widget>[
                Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                    decoration: BoxDecoration(
                        border: Border.all(color: Theme.of(context).primaryColor, width: 2)),
                    child: Text(
                      '\$${_userTransactions[index].amount.toStringAsFixed(2)}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Theme.of(context).primaryColor ),
                    )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Text(
                        _userTransactions[index].title,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.blue),
                      ),
                    ),
                    Text(
                      DateFormat.yMMMd().format(_userTransactions[index].date),
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Colors.deepPurple,
                          fontSize: 15),
                    )
                  ],
                )
              ],
            ),
          );
        },
        itemCount: _userTransactions.length,
      ),
    );
  }
}
