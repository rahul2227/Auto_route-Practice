import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class EmailLoginPage extends StatelessWidget {
  EmailLoginPage({Key? key, required this.onNext}) : super(key: key);
  final Function onNext;
  final TextEditingController _emailController = TextEditingController();
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
            padding: const EdgeInsets.symmetric(
              horizontal: 30.0,
              vertical: 30.0,
            ),
            child: TextField(
              controller: _emailController,
              textAlign: TextAlign.center,
              decoration: kCustomInputDecorator.copyWith(
                hintText: "abc@mail.com",
              ),
            ),
          ),
          SizedBox(
            width: 150,
            child: ElevatedButton(
              onPressed: () => onNext.call(_emailController.text),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [Text('Next'), Icon(Icons.navigate_next)],
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.deepPurple,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
