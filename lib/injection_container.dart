import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:init/features/order/data/datasources/restaurant_datasource.dart';
import 'package:init/features/order/data/repositories/restaurant_repository_impl.dart';
import 'package:init/features/order/domain/repositories/restaurant_repository.dart';
import 'package:init/features/order/presentation/product_bloc/product_bloc.dart';
import 'package:init/features/order/domain/usecases/get_all_products.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(() => ProductBloc(getAllProducts: sl()));

  // UseCases
  sl.registerLazySingleton(() => GetAllProducts(sl()));

  // Repository
  sl.registerLazySingleton<RestaurantRepository>(
    () => RestaurantRepositoryImpl(
      datasource: RestaurantDataSourceImpl(firestore: sl()),
    ),
  );

  // External
  sl.registerLazySingleton(() => Firestore());
}
