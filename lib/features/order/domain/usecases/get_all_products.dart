import 'package:dartz/dartz.dart';
import 'package:init/core/errors/failures.dart';
import 'package:init/features/order/domain/entities/product.dart';
import 'package:init/features/order/domain/repositories/restaurant_repository.dart';

class GetAllProducts {
  final RestaurantRepository repository;

  GetAllProducts(this.repository);

  Future<Either<Failure, List<Product>>> call() async {
    return await repository.getAllProducts();
  }
}
