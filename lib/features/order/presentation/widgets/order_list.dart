import 'package:flutter/material.dart';

import '../../domain/entities/order.dart';
import 'order_item.dart';

class OrderList extends StatelessWidget {
  final List<Order> orders;

  const OrderList({Key key, @required this.orders}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (orders == null) {
      return const CircularProgressIndicator();
    } else {
      return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 0.9),
          itemCount: orders.length,
          itemBuilder: (BuildContext context, int index) {
            final order = orders[index];
            return OrderItemList(order);
          });
    }
  }
}
