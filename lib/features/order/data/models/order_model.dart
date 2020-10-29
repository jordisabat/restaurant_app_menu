import 'package:init/features/order/domain/entities/order.dart';

class OrderModel extends Order {
  OrderModel({
    String id,
    int table,
    String date,
    int status,
    Map<String, double> orderProducts,
  }) : super(
          id: id,
          table: table,
          date: date,
          status: status,
          orderProducts: orderProducts,
        );

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      table: json['table'],
      date: json['date'],
      status: json['status'],
      orderProducts: json['orderProducts'] != null
          ? new Map<String, double>.from(json['orderProducts'])
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'table': table,
      'date': date,
      'status': status,
      'orderProducts': orderProducts,
    };
  }
}
