import 'package:flutter/material.dart';
import 'package:purserapp/chat/widgets/user_chats.dart';
import 'package:purserapp/core/abstract/auth_state.dart';
import 'package:purserapp/core/widgets/tabbed_app_scaffold.dart';

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
              icon: Icon(Icons.message),
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
                      ListView(
                        children: [UserChats(user: user)],
                      )
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
