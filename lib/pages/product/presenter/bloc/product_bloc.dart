import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_challenger/pages/product/domain/entities/product.dart';
import 'package:flutter_challenger/pages/product/domain/usecase/get_products.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';

part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProducts _getProducts;

  ProductBloc(
    this._getProducts,
  ) : super(ProductEmpty()) {
    on<GetProductEvent>((event, emit) async {
      emit(ProductLoading());
      final response = await _getProducts(event.category);

      response.fold(
        (failure) => emit(ProductError(failure.message)),
        (products) => emit(ProductSuccess(products)),
      );
    });
  }
}
