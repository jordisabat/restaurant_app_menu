import 'package:flutter/material.dart';
import 'package:init/features/order/domain/entities/product.dart';
import 'package:init/services/unsplash_helper.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem(
    this.product,
  ) : super();

  @override
  Widget build(BuildContext context) {
    return GridTile(
      footer: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
          child: Text(
            product.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
      child: Stack(children: [
        Image.network(
            MovieDbImagesProvider.getUnsplashImage(product.imagePath)),
        Positioned(
          top: 20,
          left: 10,
          child: Text(
            '\$${product.price.toString()}',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Positioned(
          top: 10,
          right: 0,
          child: RawMaterialButton(
            onPressed: () {
              print('add product to order');
            },
            elevation: 2.0,
            fillColor: Colors.purple,
            child: Icon(
              Icons.plus_one,
              color: Colors.white,
              size: 20.0,
            ),
            shape: CircleBorder(),
          ),
        ),
      ]),
    );
  }
}
