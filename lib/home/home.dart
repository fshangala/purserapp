import 'package:flutter/material.dart';
import 'package:purserapp/core/widgets/app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Home'),
    );
  }
}
