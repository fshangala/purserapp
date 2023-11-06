import 'package:flutter/material.dart';
import 'package:purserapp/core/abstract/auth_state.dart';
import 'package:purserapp/core/widgets/tabbed_app_scaffold.dart';
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
    return DefaultTabController(
        length: 4,
        child: TabbedAppScaffold(
          title: 'Home',
          tabs: const [
            Tab(
              icon: Icon(Icons.info),
            ),
            Tab(
              icon: Icon(Icons.flag),
            ),
            Tab(
              icon: Icon(Icons.person),
            ),
            Tab(icon: Icon(Icons.settings)),
          ],
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child: renderCurrentUser((user) => Column(
                    children: [
                      const Row(
                        children: [
                          Text('Bonus: 0.0'),
                          Text('Invested: 0.0'),
                          Text('Balance: 0.0'),
                        ],
                      ),
                      ListTile(
                        leading: const Icon(Icons.person),
                        subtitle: Row(children: [
                          Container(
                              padding: const EdgeInsets.all(8),
                              child: ElevatedButton(
                                  onPressed: () {},
                                  child: const Text('Deposit'))),
                          Container(
                              padding: const EdgeInsets.all(8),
                              child: ElevatedButton(
                                  onPressed: () {},
                                  child: const Text('Withdraw'))),
                          Container(
                              padding: const EdgeInsets.all(8),
                              child: ElevatedButton(
                                  onPressed: () {}, child: const Text('Send')))
                        ]),
                        title: Text(user.username),
                      ),
                      UserTransactions(user: user)
                    ],
                  )),
            ),
            renderCurrentUser((user) => const Column()),
            renderCurrentUser((user) => const Column()),
            renderCurrentUser((user) => const Column())
          ],
        ));
  }
}
