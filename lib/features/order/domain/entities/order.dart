import 'package:equatable/equatable.dart';

class Order extends Equatable {
  final String id;
  final int table;
  final String date;
  final int status;
  final Map<String, double> orderProducts;

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
