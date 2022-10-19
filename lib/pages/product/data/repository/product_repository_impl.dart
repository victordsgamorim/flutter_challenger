import 'package:dartz/dartz.dart';
import 'package:flutter_challenger/core/error/exception.dart';
import 'package:flutter_challenger/core/error/failure.dart';
import 'package:flutter_challenger/core/network/network_info.dart';
import 'package:flutter_challenger/core/util/constants/app_messages.dart';
import 'package:flutter_challenger/pages/product/data/datasource/product_remote_datasource.dart';
import 'package:flutter_challenger/pages/category/domain/entities/category.dart';
import 'package:flutter_challenger/pages/product/domain/entities/product.dart';
import 'package:flutter_challenger/pages/product/domain/repository/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final NetworkInfo _networkInfo;
  final ProductRemoteDatasource _productRemoteDatasource;

  ProductRepositoryImpl(this._networkInfo, this._productRemoteDatasource);

  @override
  Future<Either<Failure, List<Product>>> getProduct(String category) async {
    if (await _networkInfo.isConnected) {
      try {
        return Right(await _productRemoteDatasource.getProducts(category));
      } on ServerException catch (error) {
        return Left(ServerFailure(message: error.message));
      }
    }

    return Left(InternetFailure(message: Messages.network.noConnection));
  }
}
