import 'package:flutter/material.dart';
import 'package:purserapp/chat/models/chat_session.dart';
import 'package:purserapp/core/widgets/not_null_future_renderer.dart';
import 'package:purserapp/users/models/user.dart';

class UserChats extends StatefulWidget {
  final User user;
  const UserChats({super.key, required this.user});

  @override
  State<StatefulWidget> createState() {
    return _UserChats();
  }
}

class _UserChats extends State<UserChats> {
  var chatsFuture = Future.value(<ChatSession>[]);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NotNullFutureRenderer(
            future: chatsFuture,
            futureRenderer: (chats) {
              return _renderChats(chats);
            }),
      ],
    );
  }

  Widget _renderChats(List<ChatSession> chats) {
    return Column(
        children: chats
            .map((e) => ListTile(
                  leading: const Icon(Icons.person),
                  title: NotNullFutureRenderer(
                      future: e.getName(),
                      futureRenderer: (name) {
                        return Text(name);
                      }),
                ))
            .toList());
  }
}
