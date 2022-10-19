import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenger/pages/category/domain/entities/category.dart';
import 'package:flutter_challenger/pages/category/domain/entities/no_params.dart';
import 'package:flutter_challenger/pages/category/domain/usecase/get_categories.dart';
import 'package:meta/meta.dart';

part 'category_event.dart';

part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final GetCategories _getCategories;

  CategoryBloc(this._getCategories) : super(CategoryEmpty()) {
    on<GetCategoriesEvent>((event, emit) async {
      emit(CategoryLoading());
      final response = await _getCategories(NoParams());

      response.fold(
        (failure) => emit(CategoryError(failure.message)),
        (categories) => emit(CategorySuccess(categories)),
      );
    });
  }
}
