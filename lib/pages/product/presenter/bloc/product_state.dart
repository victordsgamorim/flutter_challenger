part of 'product_bloc.dart';

@immutable
abstract class ProductState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProductEmpty extends ProductState {}

class ProductLoading extends ProductState {}

class ProductSuccess extends ProductState {
  final List<Product> products;

  ProductSuccess(this.products);

  @override
  List<Object?> get props => [products];
}

class ProductError extends ProductState {
  final String message;

  ProductError(this.message);

  @override
  List<Object?> get props => [message];
}
