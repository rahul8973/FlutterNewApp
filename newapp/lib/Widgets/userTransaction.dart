import 'package:flutter/material.dart';
import 'package:newapp/Model/transaction.dart';
import './newTransaction.dart';
import './transactionlist.dart';

class UserTransaction extends StatelessWidget {

  final List<Transaction> _userTransactions;
  final Function _addNewTransaction;
  UserTransaction(this._userTransactions,this._addNewTransaction);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[NewTransaction(_addNewTransaction), 
      TransactionList(_userTransactions)],
    );
  }
  
}
