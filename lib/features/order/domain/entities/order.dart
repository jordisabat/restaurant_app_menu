import 'package:equatable/equatable.dart';

class Order extends Equatable {
  final String id;
  final int table;
  final String date;
  final int status;
  final Map<String, double> orderItems;

  Order({
    this.id,
    this.table,
    this.date,
    this.status,
    this.orderItems,
  });

  @override
  List<Object> get props => [
        id,
        table,
        date,
        status,
        orderItems,
      ];
}
