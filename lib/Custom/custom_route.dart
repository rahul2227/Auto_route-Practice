import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bottom_navigation_with_nested_routing_tutorial/routes/routes.gr.dart';

class CustomRouteWrapper extends StatelessWidget {
  const CustomRouteWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.orange,
          onPrimary: Colors.white,
          shape: const StadiumBorder(),
        ),
        onPressed: () {
          context.router.push(const CustomDetailRoute());
        },
        child: const Text(
          'Order History',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
