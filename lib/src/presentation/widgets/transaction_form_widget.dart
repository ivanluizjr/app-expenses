import 'package:expences/src/core/constants/locales/app_locales.dart';
import 'package:flutter/material.dart';

class TransactionFormWidget extends StatefulWidget {
  const TransactionFormWidget({Key? key, required this.onSubmit})
      : super(key: key);

  final void Function(String, double) onSubmit;

  @override
  State<TransactionFormWidget> createState() => _TransactionFormWidgetState();
}

class _TransactionFormWidgetState extends State<TransactionFormWidget> {
  final titleController = TextEditingController();

  final valueController = TextEditingController();

  _submitForm() {
    final title = titleController.text;
    final value = double.tryParse(valueController.text) ?? 0.0;

    if (title.isEmpty || value <= 0) {
      return;
    }

    widget.onSubmit(title, value);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              onSubmitted: (_) => _submitForm(),
              decoration: const InputDecoration(
                labelText: AppLocales.title,
              ),
            ),
            TextField(
              controller: valueController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _submitForm(),
              decoration: const InputDecoration(
                labelText: AppLocales.value,
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.purple),
              ),
              onPressed: _submitForm,
              child: const Text(AppLocales.newTransaction),
            ),
          ],
        ),
      ),
    );
  }
}
