import 'dart:math';

import 'package:expences/src/domain/entities/transaction_entity.dart';
import 'package:expences/src/presentation/widgets/transaction_form_widget.dart';
import 'package:expences/src/presentation/widgets/transaction_list_widget.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  final TransactionEntity? transactionEntity;

  const MyHomePage({
    Key? key,
    this.transactionEntity,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _transactions = [
    TransactionEntity(
      id: '01',
      date: DateTime.now(),
      title: 'Tenis',
      value: 300.1,
    ),
  ];

  _addTransaction(String title, double value) {
    final newTransaction = TransactionEntity(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  _openTransactionModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return TransactionFormWidget(onSubmit: (title, value) {
            _addTransaction(title, value);
            value;
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Despesas Pessoais'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _openTransactionModal(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text('Grafico'),
                elevation: 5,
              ),
            ),
            TransactionListWidget(transactions: _transactions),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          child: const Icon(Icons.add),
          backgroundColor: Theme.of(context).primaryColorLight,
          onPressed: () => _openTransactionModal(context),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
