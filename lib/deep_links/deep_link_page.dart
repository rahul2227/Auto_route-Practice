import 'package:flutter/material.dart';

class DeepLinkPage extends StatelessWidget {
  const DeepLinkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('Login'),
      ),
      backgroundColor: Colors.deepPurple[300],
      body: const Center(
        child: Text("This is a Deep Linked Page"),
      ),
    );
  }
}
