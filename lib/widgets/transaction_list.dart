import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:numeral/numeral.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  const TransactionList(this.transactions, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return transactions
            .isEmpty //If there is no transaction then write no transaction... and add image here is if-condition with "?"
        ? buildEmtyWarning(context)
        : buildTransactionList(context);
  }

  Column buildEmtyWarning(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          "No transactions added yet!",
          style: Theme.of(context).textTheme.headline6,
        ),
      ],
    );
  }

  ListView buildTransactionList(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return TransactionListItem(
          transactions: transactions,
          index: index,
        );
      },
      itemCount: transactions.length,
    );
  }
}

class TransactionListItem extends StatelessWidget {
  final List<Transaction> transactions;
  final int index;

  const TransactionListItem({
    Key? key,
    required this.index,
    required this.transactions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 20,
      ),
      child: ListTile(
        leading: CircleAvatar(
          foregroundColor: Colors.green.shade900,
          backgroundColor: const Color.fromARGB(255, 110, 235, 208),
          radius: 30,
          //buradaki padding işlemi yuvarlağın içindeki rakamlar için, yuvarlakların kendisi için değil
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            //fittedbox methodu ise rakamların circle'ın içinden taşmaması için gerekli
            child: FittedBox(
              child: Text('${Numeral(transactions[index].amount).format()}₺'),
            ),
          ),
        ),
        title: Text(
          transactions[index].title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(transactions[index].date),
        ),
      ),
    );
  }
}
