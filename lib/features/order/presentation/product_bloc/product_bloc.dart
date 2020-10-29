import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:init/core/errors/failures.dart';
import 'package:init/features/order/domain/entities/product.dart';
import 'package:init/features/order/domain/usecases/get_all_products.dart';

import 'package:meta/meta.dart';
part 'product_event.dart';
part 'product_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetAllProducts getAllProducts;

  ProductBloc({
    @required this.getAllProducts,
  }) : super(Empty());

  @override
  Stream<ProductState> mapEventToState(
    ProductEvent event,
  ) async* {
    if (event is GetAllProductsEvent) {
      yield state;
      yield Loading();
      final failureOrGetProducts = await getAllProducts();
      yield failureOrGetProducts.fold(
        (failure) => Error(message: _mapFailureToMessage(failure)),
        (products) => Loaded(products: products),
      );
    }
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error';
    }
  }
}
