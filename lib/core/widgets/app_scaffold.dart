import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const AppScaffold(
      {super.key, required this.title, this.children = const <Widget>[]});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(children: children),
      ),
    );
  }
}
