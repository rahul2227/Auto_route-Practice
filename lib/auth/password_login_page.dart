import 'package:flutter/material.dart';
import 'package:flutter_bottom_navigation_with_nested_routing_tutorial/constants/app_constants.dart';
import '../constants/app_constants.dart';

class PasswordLoginPage extends StatelessWidget {
  PasswordLoginPage({Key? key, required this.onNext}) : super(key: key);
  final _passwordEditingController = TextEditingController();
  final Function onNext;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Login'),
      ),
      backgroundColor: Colors.deepPurple[300],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
            child: TextField(
              controller: _passwordEditingController,
              textAlign: TextAlign.center,
              decoration: kCustomInputDecorator.copyWith(
                hintText: "Enter a password",
              ),
              obscureText: true,
            ),
          ),
          SizedBox(
            width: 150,
            child: ElevatedButton(
              onPressed: () => onNext.call(_passwordEditingController.text),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('Next'),
                  Icon(Icons.navigate_next),
                ],
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.deepPurple,
              ),
            ),
          )
        ],
      ),
    );
  }
}
