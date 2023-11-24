import 'package:flutter/material.dart';
import 'package:purserapp/core/widgets/app_scaffold.dart';
import 'package:purserapp/core/widgets/register_form.dart';
import 'package:purserapp/home/home.dart';
import 'package:purserapp/users/models/user.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static const routeName = '/register';

  @override
  State<StatefulWidget> createState() {
    return _RegisterState();
  }
}

class _RegisterState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      title: 'Register',
      children: [RegisterForm()],
    );
  }

  void setUser(User luser) {
    Navigator.pop(context);
    Navigator.pushNamed(context, HomeScreen.routeName);
  }
}
