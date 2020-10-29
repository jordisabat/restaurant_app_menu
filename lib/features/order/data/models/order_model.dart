import 'package:init/features/order/domain/entities/order.dart';

class OrderModel extends Order {
  OrderModel({
    String id,
    int table,
    String date,
    int status,
    Map<String, double> orderItems,
  }) : super(
          id: id,
          table: table,
          date: date,
          status: status,
          orderItems: orderItems,
        );

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      table: json['table'],
      date: json['date'],
      status: json['status'],
      orderItems: json['orderItems'] != null
          ? new Map<String, double>.from(json['orderItems'])
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'table': table,
      'date': date,
      'status': status,
      'orderItems': orderItems,
    };
  }
}
