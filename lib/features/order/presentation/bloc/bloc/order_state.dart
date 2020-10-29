part of 'order_bloc.dart';

abstract class OrderState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends OrderState {}

class Loading extends OrderState {}

class Loaded extends OrderState {
  final List<Order> orders;
  Loaded({@required this.orders}) : super();
}

class Error extends OrderState {
  final String message;
  Error({@required this.message}) : super();
}
