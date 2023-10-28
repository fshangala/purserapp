import 'package:flutter/material.dart';
import 'package:purserapp/core/datatypes/user.dart';
import 'package:purserapp/core/functions/go_to.dart';
import 'package:purserapp/core/widgets/app_scaffold.dart';
import 'package:purserapp/core/widgets/login_form.dart';
import 'package:purserapp/home/home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const routeName = '/login';

  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<LoginScreen> {
  User? user;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Login',
      children: [LoginForm(setUser: setUser)],
    );
  }

  void setUser(User luser) {
    goTo(context: context, routeName: HomeScreen.routeName);
  }
}
