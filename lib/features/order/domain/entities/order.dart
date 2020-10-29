import 'package:equatable/equatable.dart';

class Order extends Equatable {
  final String id;
  final int table;
  final String date;
  final int status;
  final List<OrderItem> orderProducts;

  Order({
    this.id,
    this.table,
    this.date,
    this.status,
    this.orderProducts,
  });

  @override
  List<Object> get props => [
        id,
        table,
        date,
        status,
        orderProducts,
      ];
}

class OrderItem extends Equatable {
  final String productId;
  final int quantity;
  final int status;
  OrderItem({
    this.productId,
    this.quantity,
    this.status,
  });

  @override
  List<Object> get props => [
        productId,
        quantity,
        status,
      ];
}
