import 'package:equatable/equatable.dart';

class Order extends Equatable {
  final String id;
  final int table;
  final int type;
  final String date;
  final int status;
  final Map<String, int> orderItems;

  Order({
    this.id,
    this.table,
    this.date,
    this.status,
    this.orderItems,
    this.type,
  });

  @override
  List<Object> get props => [
        id,
        table,
        date,
        status,
        orderItems,
        type,
      ];
}
