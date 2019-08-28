import 'package:flutter/material.dart';
import 'package:newapp/Model/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> _latestTransaction;

  Chart(this._latestTransaction);

  List<Map<String, Object>> get groupTransaction {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(Duration(days: index));
      var totalAmount=0.0;
      for (var item in _latestTransaction) {
        if (item.amount > 0 &&
            item.date.day == weekday.day &&
            item.date.month == weekday.month &&
            item.date.year == weekday.year) {
          totalAmount += item.amount;
        }
      }
      print(DateFormat.E().format(weekday));
      print(totalAmount.toStringAsPrecision(2));
      return {'day': DateFormat.E().format(weekday).substring(0,1), 'amount': totalAmount};
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupTransaction);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(10),
      child: Row(
        children: groupTransaction.map((data){
          return Text('${data['day']} : ${data['amount']} ');
        }).toList(),
      ),
    );
  }
}
