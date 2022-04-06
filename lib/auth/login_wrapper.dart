import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bottom_navigation_with_nested_routing_tutorial/routes/routes.gr.dart';

class LoginWrapperPage extends StatefulWidget {
  final Function(bool isLoggedIn) onLogin;

  const LoginWrapperPage({Key? key, required this.onLogin}) : super(key: key);

  @override
  State<LoginWrapperPage> createState() => _LoginWrapperPageState();
}

class _LoginWrapperPageState extends State<LoginWrapperPage> {
  String email = '';
  @override
  Widget build(BuildContext context) {
    return AutoRouter.declarative(
      routes: (_) {
        return [
          EmailLoginRoute(onNext: (result) {
            setState(() {
              email = result;
            });
          }),
          if (email.isNotEmpty)
            PasswordLoginRoute(onNext: (String pass) async {
              try {
                if (pass.isNotEmpty) {
                  var isSuccess = await validEmailPassword(email, pass);
                  widget.onLogin(isSuccess);
                }
              } catch (e) {
                print('Exception: $e');
              }
            })
        ];
      },
    );
  }

  validEmailPassword(String email, String password) {
    if (email.toLowerCase() == 'something@mail.com' &&
        password.toLowerCase() == 'something') {
      return true;
    } else {
      return false;
    }
  }
}
