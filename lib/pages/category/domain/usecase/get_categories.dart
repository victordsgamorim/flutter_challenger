import 'package:dartz/dartz.dart';
import 'package:flutter_challenger/core/error/failure.dart';
import 'package:flutter_challenger/core/usecase/usecase.dart';
import 'package:flutter_challenger/pages/category/domain/entities/category.dart';
import 'package:flutter_challenger/pages/category/domain/entities/no_params.dart';
import 'package:flutter_challenger/pages/category/domain/repository/category_repository.dart';

class GetCategories implements UseCase<NoParams, List<Category>> {
  final CategoryRepository _categoryRepository;

  GetCategories(this._categoryRepository);

  @override
  Future<Either<Failure, List<Category>>> call(NoParams request) async =>
      _categoryRepository.getCategories();
}
