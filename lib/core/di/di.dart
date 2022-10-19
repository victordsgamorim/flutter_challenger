import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_challenger/core/network/network_info.dart';
import 'package:flutter_challenger/pages/category/data/datasource/category_remote_datasource.dart';
import 'package:flutter_challenger/pages/category/data/repository/category_repository_impl.dart';
import 'package:flutter_challenger/pages/category/domain/repository/category_repository.dart';
import 'package:flutter_challenger/pages/category/domain/usecase/get_categories.dart';
import 'package:flutter_challenger/pages/category/presenter/bloc/category_bloc.dart';
import 'package:flutter_challenger/pages/product/data/datasource/product_remote_datasource.dart';
import 'package:flutter_challenger/pages/product/data/repository/product_repository_impl.dart';
import 'package:flutter_challenger/pages/product/domain/repository/product_repository.dart';
import 'package:flutter_challenger/pages/product/domain/usecase/get_products.dart';
import 'package:flutter_challenger/pages/product/presenter/bloc/product_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final GetIt getIt = GetIt.instance;

setup() {
  /**BLOC*/
  getIt.registerFactory(() => CategoryBloc(getIt()));
  getIt.registerFactory(() => ProductBloc(getIt()));

  /**USECASE*/
  getIt.registerLazySingleton(() => GetCategories(getIt()));
  getIt.registerLazySingleton(() => GetProducts(getIt()));

  /**REPOSITORY*/
  getIt.registerLazySingleton<CategoryRepository>(
      () => CategoryRepositoryImpl(getIt(), getIt()));
  getIt.registerLazySingleton<ProductRepository>(
      () => ProductRepositoryImpl(getIt(), getIt()));

  /**DATASOURCE*/
  getIt.registerLazySingleton<CategoryRemoteDatasource>(
      () => CategoryRemoteDatasourceImpl(getIt()));
  getIt.registerLazySingleton<ProductRemoteDatasource>(
      () => ProductRemoteDatasourceImpl(getIt()));

  /**CORE*/
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));

  /**EXTERNAL*/
  getIt.registerLazySingleton(() => Connectivity());
  getIt.registerLazySingleton(() => http.Client());
}
