import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:init/core/errors/exceptions.dart';
import 'package:init/features/order/data/models/product_model.dart';
import 'package:meta/meta.dart';

abstract class RestaurantDataSource {
  /// Calls Restaurant endpoint Fireabase
  ///
  /// Throws a [ServerException] for all error codes
  Future<List<ProductModel>> getAllProducts();
}

class RestaurantDataSourceImpl implements RestaurantDataSource {
  final FirebaseFirestore firestore;

  RestaurantDataSourceImpl({
    @required this.firestore,
  });

  @override
  Future<List<ProductModel>> getAllProducts() async {
    try {
      final QuerySnapshot query = await firestore.collection("products").get();

      final List<ProductModel> products =
          query.docs.map((document) => ProductModel()).toList();

      return products;
    } catch (e) {
      throw ServerException();
    }
  }
}
