part of 'product_bloc.dart';

@immutable
abstract class ProductEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetProductEvent extends ProductEvent {
  final String category;

  GetProductEvent(this.category);

  @override
  List<Object?> get props => [category];
}
