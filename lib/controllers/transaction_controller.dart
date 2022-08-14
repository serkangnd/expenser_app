import '../models/transaction.dart';

class TransactionSingleton {
  TransactionSingleton._() : userTransactionList = [];
  final List<Transaction> userTransactionList;
  static TransactionSingleton? _singleton;

  static TransactionSingleton init() {
    //bu şekilde tekrar tekrar obje oluşturmasını engelledik. Aksi halde sürekli yeni obje alarak başa getiriyor.
    return _singleton ??= TransactionSingleton._();
  }

  void transactionAdd(Transaction transaction) {
    userTransactionList.insert(0, transaction);
  }

  List<Transaction> get recentTransactions {
    return userTransactionList.where((value) {
      return value.date.isAfter(
        DateTime.now().subtract(
          const Duration(
            days: 365,
          ),
        ),
      );
    }).toList();
  }
}
