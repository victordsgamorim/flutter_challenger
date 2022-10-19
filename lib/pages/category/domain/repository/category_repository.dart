import 'package:dartz/dartz.dart';
import 'package:flutter_challenger/core/error/failure.dart';
import 'package:flutter_challenger/pages/category/domain/entities/category.dart';

abstract class CategoryRepository {
  Future<Either<Failure, List<Category>>> getCategories();
}
