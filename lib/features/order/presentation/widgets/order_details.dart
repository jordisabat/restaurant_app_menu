import 'package:flutter/material.dart';
import 'package:init/features/order/domain/entities/order.dart';

class OrderDetails extends StatelessWidget {
  final Order order;
  const OrderDetails({Key key, this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Table ${order.table}'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: order.orderProducts.length,
            itemBuilder: (BuildContext ctxt, int index) {
              final item = order.orderProducts[index];
              return ListTile(
                title: Text(item.productId),
                leading: Text(item.quantity.toString()),
              );
            },
          )),
    );
  }
}
