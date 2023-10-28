import 'package:flutter/material.dart';
import 'package:purserapp/core/abstract/auth_state.dart';
import 'package:purserapp/core/widgets/app_scaffold.dart';
import 'package:purserapp/core/widgets/user_transactions.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = '/';

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends AuthState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Home',
      children: [
        renderCurrentUser((user) => Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.person),
                  subtitle: Row(children:[
                    Container(padding: EdgeInsets.all(8),child:ElevatedButton(onPressed:(){},child:Text('Deposit'))),
                    Container(padding: EdgeInsets.all(8),child:ElevatedButton(onPressed:(){},child:Text('Withdraw'))),
                    Container(padding: EdgeInsets.all(8),child:ElevatedButton(onPressed:(){},child:Text('Send')))
                  ]),
                  title: Text(user.username),
                ),
                UserTransactions(user: user)
              ],
            ))
      ],
    );
  }
}
