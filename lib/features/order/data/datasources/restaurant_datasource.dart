import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:init/core/errors/exceptions.dart';
import 'package:init/features/order/data/models/order_model.dart';
import 'package:init/features/order/data/models/product_model.dart';
import 'package:meta/meta.dart';

abstract class RestaurantDataSource {
  /// Calls Restaurant endpoint Fireabase
  ///
  /// Throws a [ServerException] for all error codes
  Future<List<ProductModel>> getAllProducts();
  Future<List<OrderModel>> getAllOrders();
}

class RestaurantDataSourceImpl implements RestaurantDataSource {
  final Firestore firestore;

  RestaurantDataSourceImpl({
    @required this.firestore,
  });

  @override
  Future<List<ProductModel>> getAllProducts() async {
    try {
      final QuerySnapshot query =
          await firestore.collection("products").getDocuments();

      final List<ProductModel> products = query.documents
          .map((document) => ProductModel.fromJson(document.data))
          .toList();

      return products;
    } catch (e) {
      throw ServerException();
    }
  }

  @override
  Future<List<OrderModel>> getAllOrders() async {
    try {
      final QuerySnapshot query =
          await firestore.collection("orders").getDocuments();

      final List<OrderModel> orders = query.documents
          .map((document) => OrderModel.fromJson(document.data))
          .toList();

      return orders;
    } catch (e) {
      throw ServerException();
    }
  }
}
