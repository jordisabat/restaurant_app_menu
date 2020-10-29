import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:init/core/errors/failures.dart';
import 'package:init/features/order/domain/entities/order.dart';
import 'package:init/features/order/domain/usecases/get_all_orders.dart';

import 'package:meta/meta.dart';
part 'order_event.dart';
part 'order_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final GetAllOrders getAllOrders;

  OrderBloc({
    @required this.getAllOrders,
  }) : super(Empty());

  @override
  Stream<OrderState> mapEventToState(
    OrderEvent event,
  ) async* {
    if (event is GetAllOrdersEvent) {
      yield state;
      yield Loading();
      final failureOrGetOrders = await getAllOrders();
      yield failureOrGetOrders.fold(
        (failure) => Error(message: _mapFailureToMessage(failure)),
        (orders) => Loaded(orders: orders),
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
