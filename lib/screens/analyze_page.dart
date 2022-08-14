import 'package:flutter/material.dart';
import 'package:login_screen/controllers/transaction_controller.dart';
import 'package:login_screen/widgets/chart.dart';


class DeletePage extends StatefulWidget {
  const DeletePage({Key? key}) : super(key: key);

  @override
  State<DeletePage> createState() => _DeletePageState();
}

class _DeletePageState extends State<DeletePage> {
  final transactionSingleton = TransactionSingleton.init();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 230, 230),
    appBar: AppBar(
        title: const Text("Details"),
        backgroundColor: const Color.fromARGB(255, 110, 235, 208),
      ),
      body: Chart(transactionSingleton.recentTransactions),
    );
  }
}