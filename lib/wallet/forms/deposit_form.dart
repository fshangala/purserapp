import 'package:flutter/material.dart';
import 'package:purserapp/core/datatypes/transaction.dart';
import 'package:purserapp/core/functions/resolve_future.dart';
import 'package:purserapp/users/models/user.dart';

class DepositForm extends StatefulWidget {
  final User user;
  const DepositForm({super.key, required this.user});

  @override
  State<StatefulWidget> createState() {
    return _DepositForm();
  }
}

class _DepositForm extends State<DepositForm> {
  final _formKey = GlobalKey<FormState>();
  var amountController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                controller: amountController,
                decoration: const InputDecoration(
                    icon: Icon(Icons.money), labelText: 'Amount'),
              ),
            ),
            Container(
                padding: const EdgeInsets.all(8),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _deposit();
                    }
                  },
                  child: const Text('Deposit'),
                ))
          ],
        ));
  }

  void _deposit() {
    var transaction = Transaction()
        .create(TransactionModelArguments(
            userId: widget.user.id!,
            amount: double.parse(amountController.text),
            description: 'deposit',
            approved: true))
        .save();
    resolveFuture(context, transaction, (value) {
      Navigator.pop(context);
    });
  }
}
