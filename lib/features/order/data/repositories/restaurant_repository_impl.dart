import 'package:init/core/errors/exceptions.dart';
import 'package:init/features/order/data/datasources/restaurant_datasource.dart';
import 'package:init/features/order/domain/entities/product.dart';
import 'package:init/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:init/features/order/domain/repositories/restaurant_repository.dart';
import 'package:meta/meta.dart';
import '../../domain/entities/order.dart' as order;

class RestaurantRepositoryImpl implements RestaurantRepository {
  final RestaurantDataSource datasource;
  RestaurantRepositoryImpl({
    @required this.datasource,
  });

  @override
  Future<Either<Failure, List<Product>>> getAllProducts() async {
    try {
      final products = await datasource.getAllProducts();
      return Right(products);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<order.Order>>> getAllOrders() async {
    try {
      final orders = await datasource.getAllOrders();
      return Right(orders);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
