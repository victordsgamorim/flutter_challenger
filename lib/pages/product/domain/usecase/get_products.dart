import 'package:dartz/dartz.dart';
import 'package:flutter_challenger/core/error/failure.dart';
import 'package:flutter_challenger/core/usecase/usecase.dart';
import 'package:flutter_challenger/pages/product/domain/entities/product.dart';
import 'package:flutter_challenger/pages/product/domain/repository/product_repository.dart';

class GetProducts implements UseCase<String, List<Product>> {
  final ProductRepository _productRepository;

  GetProducts(this._productRepository);

  @override
  Future<Either<Failure, List<Product>>> call(String request) async =>
      await _productRepository.getProduct(request);
}
