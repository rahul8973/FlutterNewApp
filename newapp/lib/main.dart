import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newapp/Widgets/chart.dart';
import 'Model/transaction.dart';
import 'Widgets/newTransaction.dart';
import 'Widgets/transactionlist.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
          primarySwatch: Colors.purple,
          textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                  fontFamily: 'Opensans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold))),
      home: MyHomepage(),
    );
  }
}

class MyHomepage extends StatefulWidget {
  // String newTitle;
  // String newAmount;
  @override
  _MyHomepageState createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  final titleController = new TextEditingController();
  final amountController = new TextEditingController();

  final List<Transaction> _userTransactions = [
    Transaction(
        id: 't1', title: 'new shoes', amount: 69.99890, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Groceries', amount: 99.899879685, date: DateTime.now()),
  ];
  List<Transaction> get recentTransaction {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(
        days: 7,
      )));
    }).toList();
  }

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
        title: txTitle,
        amount: txAmount,
        date: DateTime.now(),
        id: DateTime.now().toString());

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(_addNewTransaction),
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My FLutter App',
          style: Theme.of(context).textTheme.title,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            iconSize: 35,
            onPressed: () {
              _startAddNewTransaction(context);
            },
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(width: double.infinity, child: Chart(recentTransaction)),
          _userTransactions.length == 0
              ? Column(
                  children: <Widget>[
                    Text(
                      'No Transaction Available',
                      style: Theme.of(context).textTheme.title,
                    ),
                    Image.asset('Assets/images/hancock.png'),
                  ],
                )
              : TransactionList(_userTransactions),
          //UserTransaction(_userTransactions,_addNewTransaction)
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          size: 30,
        ),
        onPressed: () {
          _startAddNewTransaction(context);
        },
        backgroundColor: Colors.cyan,
      ),
    );
  }
}
