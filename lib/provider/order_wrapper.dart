import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'orders.dart';

class OrdersWrapperPage extends StatelessWidget {
  const OrdersWrapperPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (BuildContext context) => Order(),
      child: const AutoRouter(),
    );
  }
}
