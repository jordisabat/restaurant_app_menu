import 'package:init/features/order/domain/entities/order.dart';

class OrderModel extends Order {
  OrderModel({
    String id,
    int table,
    String date,
    int status,
    List<OrderItem> orderProducts,
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
          ? new OrderItemModel.fromMap(json['orderProducts'])
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

// ignore: must_be_immutable
class OrderItemModel extends OrderItem {
  String productId;
  int quantity;
  int status;

  OrderItemModel({
    this.productId,
    this.quantity,
    this.status,
  });

  OrderItemModel.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    quantity = json['quantity'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['quantity'] = this.quantity;
    data['status'] = this.status;
    return data;
  }

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'quantity': quantity,
      'status': status,
    };
  }

  factory OrderItemModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return OrderItemModel(
      productId: map['productId'],
      quantity: map['quantity'],
      status: map['status'],
    );
  }
}
