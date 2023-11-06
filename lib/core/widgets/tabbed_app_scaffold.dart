import 'package:flutter/material.dart';

class TabbedAppScaffold extends StatelessWidget {
  final String title;
  final List<Widget> tabs;
  final List<Widget> children;
  const TabbedAppScaffold(
      {super.key,
      required this.title,
      required this.tabs,
      required this.children});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: tabs.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text(title),
            bottom: TabBar(tabs: tabs),
          ),
          body: TabBarView(children: children),
        ));
  }
}
