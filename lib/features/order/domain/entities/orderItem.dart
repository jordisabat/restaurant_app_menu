import 'package:equatable/equatable.dart';

class OrderItem extends Equatable {
  final String id;
  final String name;
  final double price;
  final int type;

  OrderItem({
    this.id,
    this.name,
    this.price,
    this.type,
  });

  @override
  List<Object> get props => [
        name,
        price,
        type,
      ];
}
