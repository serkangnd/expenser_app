import 'package:flutter/material.dart';
import 'package:login_screen/controllers/transaction_controller.dart';
import 'package:login_screen/models/transaction.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class NewTransaction extends StatefulWidget {
  // final Function addTx;
  const NewTransaction({
    Key? key,
  }) : super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  DateTime date = DateTime.now();
  //---------------------------------------Singleton
  final transactionSingleton = TransactionSingleton.init();

  void submitData() {
    if (formKey.currentState!.validate()) {
      final enteredTileTxt = titleController.text;
      final enteredAmountTxt = double.tryParse(amountController.text);

      if (enteredTileTxt.isEmpty || enteredAmountTxt == null) {
        return;
      }

      final newTx = Transaction(
        id: date.toString(),
        title: enteredTileTxt,
        amount: enteredAmountTxt,
        date: date,
      );

      //Adding newTx to singleton userTransactionList
      transactionSingleton.transactionAdd(newTx);

      titleController.clear();
      amountController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        elevation: 5,
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              //TitleSection
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none),
                  hintText: "Title",
                ),
                controller: titleController,
                validator: (String? data) {
                  if (data!.isEmpty) {
                    return "Value can not be blank!";
                  }
                  return null;
                },
                onFieldSubmitted: (_) => submitData(),
              ),
              //Amount section
              TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none),
                  hintText: "Amount",
                ),
                controller: amountController,
                keyboardType: TextInputType.number,
                validator: (String? data) {
                  if (data!.isEmpty) {
                    return "Value can not be blank!";
                  }
                  return null;
                },
                onFieldSubmitted: (_) => submitData(),
              ),
              //DatePicker
              Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "Picked Date : ${DateFormat.yMd().format(date)}",
                      ),
                    ),
                  ),
                  //new button
                  TextButton(
                    //butona ana rengi verme bölümü
                    style: TextButton.styleFrom(primary: Colors.green.shade800),
                    child: const Text(
                      "Choose Date!",
                      style: TextStyle(fontWeight: FontWeight.bold),
                      //main.dart taki textheme'den textheme alma
                      // style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.purple ),
                    ),
                    onPressed: () async {
                      DateTime? newDate = await showDatePicker(
                        context: context,
                        initialDate: date,
                        firstDate: DateTime(date.year),
                        lastDate: DateTime.now(),
                      );
                      //if "Cancel" => null
                      if (newDate == null) {
                        return;
                      }
                      //if "Ok" => DateTime set
                      setState(() {
                        //seçilen tarihi date variableına geçiriyor.
                        date = newDate;
                      });
                    },
                  )
                ],
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 73, 197, 178)),
                    onPressed: submitData,
                    child: Text(
                      'Add Transaction',
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
