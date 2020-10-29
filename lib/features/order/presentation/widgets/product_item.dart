import 'package:flutter/material.dart';
import 'package:init/features/order/domain/entities/product.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem(
    this.product,
  ) : super();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {},
      child: Container(
        width: 20,
        padding: const EdgeInsets.all(6),
        child: Card(
          child: ListTile(
            title: Text(
              product.name,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              product.price.toString(),
            ),
          ),
        ),
      ),
    );
  }
}
