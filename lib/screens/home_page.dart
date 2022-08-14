import 'package:flutter/material.dart';
import 'package:login_screen/controllers/transaction_controller.dart';
import '../models/transaction.dart';
import '../models/user_data.dart';
import '../widgets/transaction_list.dart';

class HomeScreen extends StatefulWidget {
  final UserData userData;
  const HomeScreen({Key? key, required this.userData}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  //singleton call
  final transactionSingleton = TransactionSingleton.init();

  final List<Transaction> userTransactions = [
    //Açıldığı zaman gelen ilk veriler.
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Weekly Groceries',
      amount: 16.53,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 230, 230),
      appBar: AppBar(
        title: Text(widget.userData.userMail.toString()),
        backgroundColor: const Color.fromARGB(255, 110, 235, 208),
      ),
      body: TransactionList(transactionSingleton.userTransactionList),
    );
  }
}
