import 'dart:math';

import 'package:expences/src/domain/usecase/transaction.dart';
import 'package:expences/src/presentation/widgets/transaction_form_widget.dart';
import 'package:expences/src/presentation/widgets/transaction_list_widget.dart';
import 'package:flutter/material.dart';

class TransactionUserWidget extends StatefulWidget {
  const TransactionUserWidget({Key? key}) : super(key: key);

  @override
  State<TransactionUserWidget> createState() => _TransactionUserWidgetState();
}

class _TransactionUserWidgetState extends State<TransactionUserWidget> {
  final _transactions = [
    Transaction(
      id: '01',
      date: DateTime.now(),
      title: 'Tenis',
      value: 300.1,
    ),
    Transaction(
      id: '02',
      date: DateTime.now(),
      title: 'Meia',
      value: 20.0,
    ),
  ];

  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionFormWidget(
          onSubmit: _addTransaction,
        ),
        TransactionListWidget(transactions: _transactions),
      ],
    );
  }
}
