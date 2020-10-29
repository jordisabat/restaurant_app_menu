import 'package:flutter/material.dart';
import 'package:init/features/order/domain/entities/product.dart';
import 'package:init/features/order/presentation/widgets/product_item.dart';

class ProductList extends StatelessWidget {
  final List<Product> products;

  const ProductList({Key key, @required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (products == null) {
      return const CircularProgressIndicator();
    } else {
      return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 0.9),
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) {
            final product = products[index];
            return ProductItem(product);
          });
    }
  }
}
