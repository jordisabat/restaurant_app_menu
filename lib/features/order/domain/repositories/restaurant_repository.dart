import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/entities/order.dart' as order;
import '../entities/product.dart';

abstract class RestaurantRepository {
  Future<Either<Failure, List<Product>>> getAllProducts();
  Future<Either<Failure, List<order.Order>>> getAllOrders();

  Future<Either<Failure, Order>> createOrder();
  Future<Either<Failure, Order>> updateOrder();
  Future<Either<Failure, Unit>> deleteOrder();
}
