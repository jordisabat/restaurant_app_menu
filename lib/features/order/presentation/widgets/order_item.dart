import 'package:flutter/material.dart';
import 'package:init/features/order/domain/entities/order.dart';

class OrderItemList extends StatelessWidget {
  final Order order;

  const OrderItemList(
    this.order,
  ) : super();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {},
      child: Container(
        width: 20,
        padding: const EdgeInsets.all(6),
        child: Card(
          child: ListTile(
            title: Text(
              order.date,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              order.orderProducts.length.toString(),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
    );
  }
}
