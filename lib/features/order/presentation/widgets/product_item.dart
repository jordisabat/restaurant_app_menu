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
    return GestureDetector(
        onTap: () => {},
        child: GridTile(
          footer: Container(
              color: Colors.white,
              alignment: Alignment.center,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
                child: Text(
                  product.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              )),
          child: Stack(children: [
            Image.network(
                MovieDbImagesProvider.getUnsplashImage(product.imagePath)),
            Positioned(
              top: 6,
              left: 6,
              child: Text(
                product.price.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ]),
        ));
  }
}
