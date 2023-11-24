import 'package:flutter/material.dart';
import 'package:purserapp/core/abstract/auth_state.dart';
import 'package:purserapp/core/widgets/app_scaffold.dart';
import 'package:purserapp/core/widgets/null_future_renderer.dart';
import 'package:purserapp/wallet/forms/deposit_form.dart';

class DepositScreen extends StatefulWidget {
  const DepositScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _DepositScreen();
  }
}

class _DepositScreen extends AuthState<DepositScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Deposit',
      children: [
        NullFutureRenderer(
            future: userFuture,
            futureRenderer: (user) {
              return ListView(
                children: [DepositForm(user: user)],
              );
            })
      ],
    );
  }
}
