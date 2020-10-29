import 'package:dartz/dartz.dart';
import 'package:init/core/errors/failures.dart';
import 'package:init/features/order/domain/entities/product.dart';

abstract class RestaurantRepository {
  Future<Either<Failure, List<Product>>> getAllProducts();
  Future<Either<Failure, List<Product>>> getProductsByType(int type);
}
