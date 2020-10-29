import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../entities/order.dart' as order;
import '../repositories/restaurant_repository.dart';

class GetAllOrders {
  final RestaurantRepository repository;

  GetAllOrders(this.repository);

  Future<Either<Failure, List<order.Order>>> call() async {
    return await repository.getAllOrders();
  }
}
