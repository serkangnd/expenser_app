import 'package:flutter/material.dart';
import 'package:login_screen/widgets/new_transaction.dart';

class AdditionPage extends StatefulWidget {
  const AdditionPage({
    Key? key,
  }) : super(key: key);

  @override
  State<AdditionPage> createState() => _AdditionPageState();
}

class _AdditionPageState extends State<AdditionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 230, 230),
      appBar: AppBar(
        title: const Text("Addition"),
        backgroundColor: const Color.fromARGB(255, 110, 235, 208),
      ),
      body: const NewTransaction(),
    );
  }
}
