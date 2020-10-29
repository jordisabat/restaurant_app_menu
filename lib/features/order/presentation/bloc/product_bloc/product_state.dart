part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  @override
  List<Object> get props => [];
}

class Empty extends ProductState {}

class Loading extends ProductState {}

class Loaded extends ProductState {
  final List<Product> products;
  Loaded({@required this.products}) : super();
}

class Error extends ProductState {
  final String message;
  Error({@required this.message}) : super();
}
