import 'package:init/features/order/domain/entities/product.dart';

class ProductModel extends Product {
  ProductModel({
    String id,
    String name,
    double price,
    int type,
    String imagePath,
  }) : super(
          id: id,
          name: name,
          price: price,
          type: type,
          imagePath: imagePath,
        );

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      price: json['price'].toDouble(),
      type: json['type'],
      imagePath: json['imagePath'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'type': type,
      'imagePath': imagePath,
    };
  }
}
