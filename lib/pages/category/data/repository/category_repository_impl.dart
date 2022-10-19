import 'package:dartz/dartz.dart';
import 'package:flutter_challenger/core/error/exception.dart';
import 'package:flutter_challenger/core/error/failure.dart';
import 'package:flutter_challenger/core/network/network_info.dart';
import 'package:flutter_challenger/core/util/constants/app_messages.dart';
import 'package:flutter_challenger/pages/category/data/datasource/category_remote_datasource.dart';
import 'package:flutter_challenger/pages/category/domain/entities/category.dart';
import 'package:flutter_challenger/pages/category/domain/repository/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final NetworkInfo _networkInfo;
  final CategoryRemoteDatasource _categoryRemoteDatasource;

  CategoryRepositoryImpl(this._networkInfo, this._categoryRemoteDatasource);

  @override
  Future<Either<Failure, List<Category>>> getCategories() async {
    if (await _networkInfo.isConnected) {
      try {
        return Right(await _categoryRemoteDatasource.getCategories());
      } on ServerException catch (error) {
        return Left(ServerFailure(message: error.message));
      }
    }

    return Left(InternetFailure(message: Messages.network.noConnection));
  }
}
