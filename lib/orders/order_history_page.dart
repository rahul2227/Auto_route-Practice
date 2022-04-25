import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/orders.dart';

class OrderHistory extends StatelessWidget {
  const OrderHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var orderData = Provider.of<Order>(context);
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Order History ${orderData.orderCount}',
            style: const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
