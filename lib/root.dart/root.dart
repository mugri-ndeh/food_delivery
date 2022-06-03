import 'package:delivery_app/auth/provider/auth.dart';
import 'package:delivery_app/auth/screens/login.dart';
import 'package:delivery_app/auth/screens/signup.dart';
import 'package:delivery_app/home/screens/base.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthRoot extends StatelessWidget {
  const AuthRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Authentication>(builder: (_, auth, __) {
      // ignore: avoid_print
      print('Auth state is');
      // ignore: avoid_print
      print(auth.loginState);
      switch (auth.loginState) {
        case AuthState.loggedIn:
          return BaseScreen();
        case AuthState.loggedOut:
          return const LoginScreen();
        case AuthState.signup:
          return const SignUp();
        case AuthState.login:
          return const LoginScreen();
        case AuthState.loading:
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        default:
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
      }
      //return user != null ? HomeScreen() : Register();
    });
  }
}
