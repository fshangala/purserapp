import 'package:flutter/material.dart';
import 'package:purserapp/core/datatypes/user.dart';
import 'package:purserapp/core/functions/go_to.dart';
import 'package:purserapp/core/widgets/null_future_renderer.dart';
import 'package:purserapp/users/login.dart';

abstract class AuthState<T extends StatefulWidget> extends State<T> {
  late Future<User?> userFuture;

  void afterInit() {}

  @override
  initState() {
    super.initState();
    userFuture = User().loggedInUser();
    userFuture.then((value) {
      if (value == null) {
        goTo(context: context, routeName: LoginScreen.routeName);
      }
    });
    afterInit();
  }

  Widget renderCurrentUser(Widget Function(User user) renderer) {
    return NullFutureRenderer(
        future: userFuture,
        futureRenderer: (luser) {
          return renderer(luser);
        });
  }
}
