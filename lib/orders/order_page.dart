import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bottom_navigation_with_nested_routing_tutorial/orders/order_history_page.dart';
import 'package:provider/provider.dart';

import '../Providers/order_inc.dart';
import '../routes/routes.gr.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Order details',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.deepPurple,
              onPrimary: Colors.white,
              shape: const StadiumBorder(),
            ),
            onPressed: () {
              Provider.of<Order>(context, listen: false).increementOrderCount();
              context.router.push(const OrderHistoryRoute());
            },
            child: const Text(
              'Order History',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
