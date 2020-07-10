//import 'package:Palma/widgets/cart_item.dart';
import 'package:flutter/foundation.dart';
import './cart.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> foods;
  final DateTime dateTime;

  OrderItem({
    this.id,
    this.amount,
    this.foods,
    this.dateTime,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> cartItems, double total) {
    if (total == 0) {
      print(
          "nothing ordered"); //notify that you need to add something b4 ordering
    } else {
      _orders.insert(
        0,
        OrderItem(
          id: DateTime.now().toString(),
          amount: total,
          dateTime: DateTime.now(),
          foods: cartItems,
        ),
      );
      notifyListeners();
    }
  }
}
