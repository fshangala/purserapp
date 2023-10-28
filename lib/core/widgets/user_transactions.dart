import 'package:flutter/material.dart';
import 'package:purserapp/core/datatypes/model.dart';
import 'package:purserapp/core/datatypes/transaction.dart';
import 'package:purserapp/core/datatypes/user.dart';
import 'package:purserapp/core/widgets/not_null_future_renderer.dart';

class UserTransactions extends StatefulWidget {
  final User user;
  const UserTransactions({super.key, required this.user});

  @override
  State<StatefulWidget> createState() => _UserTransactions();
}

class _UserTransactions extends State<UserTransactions> {
  Future<List<Transaction>> transactionsFuture = Future.value([]);
  @override
  initState() {
    super.initState();
    getTransactions();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NotNullFutureRenderer(
            future: transactionsFuture,
            futureRenderer: (transactions) {
              return Column(
                children: transactions
                    .map((e) => ListTile(
                          leading: Text('#${e.id}'),
                          title: Text(e.amount.toString()),
                          subtitle: Text(e.description),
                          trailing: Text(e.approved.toString()),
                        ))
                    .toList(),
              );
            }),
        ListTile(
          title: const Text('RELOAD'),
          trailing: const Icon(Icons.repeat),
          onTap: () {
            setState(() {
              getTransactions();
            });
          },
        )
      ],
    );
  }

  void getTransactions() {
    transactionsFuture = Transaction()
        .getObjects(QueryBuilder().where('userId', widget.user.id!));
  }
}
