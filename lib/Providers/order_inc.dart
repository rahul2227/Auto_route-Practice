import 'package:flutter/material.dart';

class Order extends ChangeNotifier {
  int _orderCount = 0;

  int get orderCount {
    return _orderCount;
  }

  void increementOrderCount() {
    _orderCount++;
    notifyListeners();
  }
}
