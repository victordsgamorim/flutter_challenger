part of 'category_bloc.dart';

@immutable
abstract class CategoryState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CategoryEmpty extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategorySuccess extends CategoryState {
  final List<Category> categories;

  CategorySuccess(this.categories);

  @override
  List<Object?> get props => [categories];
}

class CategoryError extends CategoryState {
  final String message;

  CategoryError(this.message);

  @override
  List<Object?> get props => [message];
}
