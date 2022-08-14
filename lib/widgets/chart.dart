import 'package:flutter/material.dart';
import 'package:login_screen/models/transaction.dart';
import 'package:login_screen/widgets/chart_bar.dart';
import '../models/date_list.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  const Chart(
    this.recentTransactions, {
    Key? key,
  }) : super(key: key);

  List<Map<String, dynamic>> get groupedTransactionValues {
    List<Map<String, dynamic>> list = [];
    for (var i = 0; i < DateConstants.monthList.length; i++) {
      var totalSum = 0.0;
      for (var j = 0; j < recentTransactions.length; j++) {
        if (recentTransactions[j].date.month == i + 1 &&
            recentTransactions[j].date.year == DateTime.now().year) {
          totalSum += recentTransactions[j].amount;
        }
      }
      //map yapmak yerine burada variable oluşturduk.
      //modele dönüştür - bittiği zaman
      var chartData = {
        "amount": totalSum,
        "month": DateConstants.monthList[i],
        "monthIndex": i + 1,
      };
      //map yapmak yerine burada variable oluşturduk.
      //modele dönüştür - bittiği zaman
      list.add(chartData);
    }
    return list;
  }

  double get maxSpending {
    double value = groupedTransactionValues.fold(
      0.0,
      (sum, item) {
        return sum + (item["amount"] as double);
      },
    );
    return value == 0 ? 1 : value;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: groupedTransactionValues.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                data["month"].substring(0, 3),
                data["amount"] as double,
                ((data["amount"] as double) / maxSpending),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
