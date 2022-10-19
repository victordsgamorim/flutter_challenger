import 'package:dartz/dartz.dart';
import 'package:flutter_challenger/core/error/failure.dart';
import 'package:flutter_challenger/pages/product/domain/entities/product.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<Product>>> getProduct(String category);
}
